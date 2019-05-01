Ext.define('app.view.displayNews.newsList', {
    extend: 'Ext.grid.Panel',
    xtype: 'view-displayNews-newsList',
    requires: [],
    padding: "10px 20px 0 20px",
    config: {
        tabtitle: ''
    },
    constructor: function (config) {
        var me = this;
        config = config || {};
        Ext.applyIf(config, me.config);
        this.callParent(arguments);
    },
    initComponent: function () {
        var me = this;

        var newstore = Ext.create('Ext.data.Store', {
            id: 'simpsonsStore',
            autoLoad: true,
            pageSize: 15, // 每页的条目数量
            proxy: {
                type: 'ajax',
                url: 'newsMg/queryNewList',
                reader: {
                    type: 'json',
                    rootProperty: 'rows',
                    totalProperty: "total"
                }
            }
        });
        Ext.apply(me, {
            tbar: {
                layout: 'column',
                scope: me,
                items: []
            },
            border: true,
            store: newstore,
            title: me.config.tabtitle,
            // columnLines: true,
            // closable: true,
            viewConfig: {
                enableTextSelection: true
            },
            columns: [
                {text: '新闻id', dataIndex: 'id', width: '20%', align: 'center'},
                {text: '新闻标题', dataIndex: 'title', width: '20%', align: 'center'},
                {text: '发布人id', dataIndex: 'releaseId', width: '19%', align: 'center'},
                {text: '发布时间', dataIndex: 'releaseDate', width: '20%', align: 'center'},
                {text: '更新时间', dataIndex: 'updateDate', width: '20%', align: 'center'},
            ],
            listeners: {
                celldblclick: function (cmp,td,cellndex,record,tr,rowindex,e,eopts) {
                   me.infoWindow ('view', record);
                }
            },
            dockedItems: [
                {
                    xtype: 'pagingtoolbar',
                    dock: 'bottom',
                    displayInfo: true,
                    store: newstore
                }
            ]


        })
        ;
        me.callParent(arguments);
    },

    //详情窗口
    infoWindow: function (operation, selectData) {
        // window.open("http://www.jb51.net");
        var me = this;
        var result;
        Ext.Ajax.request({
            url: 'newsMg/findNewsInfo',
            params: {'id': selectData.get('id')},
            method: 'POST',
            async:false,
            success: function (response, options) {

                var response = JSON.parse(response.responseText);
                if (response.success) {
                    result = response.result;
                    // Ext.getCmp('newsInfo').getForm().setValues(result);
                } else {
                    Ext.Msg.alert("系统提示", response.message);
                }

            },
            failure: function (response) {
                Ext.Msg.alert("系统提示", "请求超时");
            }
        });

        Ext.create("Ext.window.Window", {
            title: result['title'],
            modal: true,
            layout: 'fit',
            width: '75%',
            height: '75%',
            scrollable:'y',
            resizable: false,
            padding:'10 10 10 10',
            html:result['details'],
            fbar: [
                '->',
                {
                    xtype: 'button',
                    text: "关闭",
                    handler: function (btn) {
                        var win = btn.up().up();
                        win.close();
                    }
                }
            ]
        }).show();
    },


});
