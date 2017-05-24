package com.dediwidartodkk.apiandroidcrud;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AbsListView;
import android.widget.EditText;
import android.widget.ListView;

import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.JsonArrayRequest;
import com.dediwidartodkk.apiandroidcrud.adapter.Adapter;
import com.dediwidartodkk.apiandroidcrud.app.AppController;
import com.dediwidartodkk.apiandroidcrud.data.Data;
import com.dediwidartodkk.apiandroidcrud.until.Server;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements SwipeRefreshLayout.OnRefreshListener,NavigationView.OnNavigationItemSelectedListener {

    Toolbar toolbar;
    FloatingActionButton fab;
    ListView list;
    SwipeRefreshLayout swipe;
    List<Data> itemList = new ArrayList<Data>();
    Adapter adapter;
    int success;
    AlertDialog.Builder dialog;
    LayoutInflater inflater;
    View dialogView;
    EditText txt_id, txt_nama, txt_alamat;
    String id, nama, alamat;

    private static final String TAG = MainActivity.class.getSimpleName();

    private static String url_select 	 = Server.URL + "news.php?offset=";

    private int offSet = 0;
    int no;

    public static final String TAG_NO       = "no";
    public static final String TAG_ID       = "id";
    public static final String TAG_NAMA     = "nama";
    public static final String TAG_ALAMAT      = "alamat";
    private static final String TAG_SUCCESS = "success";
    private static final String TAG_MESSAGE = "message";
    Handler handler;
    Runnable runnable;

    String tag_json_obj = "json_obj_req";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        toolbar = (Toolbar) findViewById(R.id.toolbar);
         setSupportActionBar(toolbar);
       // HomeFragment fragment = new HomeFragment();
       // FragmentTransaction fragmentTransaction = getSupportFragmentManager().beginTransaction();
        //fragmentTransaction.replace(R.id.framelayout, fragment);
        //fragmentTransaction.commit();

        // menghubungkan variablel pada layout dan pada java
        swipe   = (SwipeRefreshLayout) findViewById(R.id.swipe_refresh_layout);
        list    = (ListView) findViewById(R.id.list);
        itemList.clear();

        // untuk mengisi data dari JSON ke dalam adapter
        adapter = new Adapter(MainActivity.this, itemList);
        list.setAdapter(adapter);

        // menamilkan widget refresh
        swipe.setOnRefreshListener(this);

        swipe.post(new Runnable() {
                       @Override
                       public void run() {
                           swipe.setRefreshing(true);
                           itemList.clear();
                           adapter.notifyDataSetChanged();
                           callVolley(0);
                       }
                   }
        );





        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);

        list.setOnScrollListener(new AbsListView.OnScrollListener() {

            private int currentVisibleItemCount;
            private int currentScrollState;
            private int currentFirstVisibleItem;
            private int totalItem;

            @Override
            public void onScrollStateChanged(AbsListView view, int scrollState) {
                this.currentScrollState = scrollState;
                this.isScrollCompleted();
            }

            @Override
            public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
                this.currentFirstVisibleItem = firstVisibleItem;
                this.currentVisibleItemCount = visibleItemCount;
                this.totalItem = totalItemCount;
            }

            private void isScrollCompleted() {
                if (totalItem - currentFirstVisibleItem == currentVisibleItemCount
                        && this.currentScrollState == SCROLL_STATE_IDLE) {

                    swipe.setRefreshing(true);
                    handler = new Handler();

                    runnable = new Runnable() {
                        public void run() {
                            callVolley(offSet);
                        }
                    };

                    handler.postDelayed(runnable, 3000);
                }
            }

        });



    }

    @Override
    public void onRefresh() {
        itemList.clear();
        adapter.notifyDataSetChanged();
        callVolley(0);
    }

    // untuk mengosongi edittext pada form
    private void kosong(){
        txt_id.setText(null);
        txt_nama.setText(null);
        txt_alamat.setText(null);
    }



private void callVolley(int page){

    swipe.setRefreshing(true);

    // Creating volley request obj
    JsonArrayRequest arrReq = new JsonArrayRequest(url_select + page,
            new Response.Listener<JSONArray>() {
                @Override
                public void onResponse(JSONArray response) {
                    Log.d(TAG, response.toString());

                    if (response.length() > 0) {
                        // Parsing json
                        for (int i = 0; i < response.length(); i++) {
                            try {

                                JSONObject obj = response.getJSONObject(i);
                                Data item = new Data();

                                no = obj.getInt(TAG_NO);

                                item.setId(obj.getString(TAG_ID));
                                item.setNama(obj.getString(TAG_NAMA));


                                item.setalamat(obj.getString(TAG_ALAMAT));

                                // adding news to news array
                                itemList.add(item);

                                if (no > offSet)
                                    offSet = no;

                                Log.d(TAG, "offSet " + offSet);

                            } catch (JSONException e) {
                                Log.e(TAG, "JSON Parsing error: " + e.getMessage());
                            }

                            // notifying list adapter about data changes
                            // so that it renders the list view with updated data
                            adapter.notifyDataSetChanged();
                        }
                    }
                    swipe.setRefreshing(false);
                }

            }, new Response.ErrorListener() {

        @Override
        public void onErrorResponse(VolleyError error) {
            VolleyLog.d(TAG, "Error: " + error.getMessage());
            swipe.setRefreshing(false);
        }
    });

    // Adding request to request queue
    AppController.getInstance().addToRequestQueue(arrReq);
}



    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.nav_login) {
            Intent intent = new Intent(this, LoginActivity.class);
            this.startActivity(intent);
            return true;

        } else if (id == R.id.nav_register) {

            Intent intent = new Intent(this, RegisterActivity.class);
            this.startActivity(intent);
            return true;


        }
        else if (id == R.id.exit_app) {
            AlertDialog.Builder builder1 = new AlertDialog.Builder(MainActivity.this);
            builder1.setMessage("Apakah kamu ingin Keluar aplikasi.");
            builder1.setCancelable(true);

            builder1.setPositiveButton(
                    "Ya",
                    new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int id) {

                            finish();
                            System.exit(0);
                        }
                    });

            builder1.setNegativeButton(
                    "Tidak",
                    new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int id) {

                            dialog.cancel();

                        }
                    });

            AlertDialog alert11= builder1.create();
            alert11.show();

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.crud, menu);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        //handle presses on the action bar items
        switch (item.getItemId()) {

            case R.id.action_cari:
                startActivity(new Intent(this, cari.class));
                return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
