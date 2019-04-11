
Ext.define('app.view.personelMg.adminMg', {
    id: "adminMgGrid",
    extend: 'Ext.grid.Panel',
    xtype: 'view-personelMg-adminMg',
    requires: [],
    padding: "10px 20px 0 20px",
    config: {
        tabtitle:''
    },
    constructor: function (config) {
        var me = this;
        config = config || {};
        Ext.applyIf(config, me.config);
        this.callParent(arguments);
    },
    initComponent: function () {
        var me = this;

        var studestore = Ext.create('Ext.data.Store', {
            id: 'simpsonsStore',
            autoLoad: true,
            // fields: ['stuName', 'age', 'sex'],
            pageSize: 20, // 每页的条目数量
            proxy: {
                type: 'ajax',
                url: 'PersonelMg/queryAdminList',
                reader: {
                    type: 'json',
                    rootProperty: 'items',
                }
            }
        });
        Ext.apply(me, {
            tbar: {
                layout: 'column', scope: me,
                items: [

                    {
                        xtype: 'toolbar', columnWidth: 1, scope: me, itemId: 'search',
                        items: [
                            {
                                xtype: 'button', text: '申报', scope: me, glyph: 'xf234@FontAwesome',
                                accessUrl: 'createAccount',
                                itemId: 'bt_create',
                                handler: function () {
                                }
                            },
                            {
                                xtype: 'button',
                                accessUrl: 'editAccount',
                                text: '修改', scope: me, glyph: 'xf044@FontAwesome',
                                itemId: 'bt_edit',
                                handler: function (btn) {
                                }
                            },
                            {
                                xtype: 'button',
                                accessUrl: 'delAccount',
                                text: '删除', scope: me, glyph: 'xf014@FontAwesome',
                                itemId: 'bt_del',
                                handler: function () {
                                }
                            }
                        ]
                    }
                ]
            },
            border: true,
            store: studestore,
            title: me.config.tabtitle,
            // columnLines: true,
            closable: true,
            viewConfig: {
                enableTextSelection: true
            },
            columns: [
                {text: '管理员号', dataIndex: 'adNum', width: '20%', align: 'center'},
                {text: '姓名', dataIndex: 'adName', width: '20%', align: 'center'},
                {text: '性别', dataIndex: 'sex', width: '19%', align: 'center'},
                {text: '年龄', dataIndex: 'age', width: '20%', align: 'center'},
                {text: '电话号码', dataIndex: 'phoneNum', width: '20%', align: 'center'},
            ],
            listeners: {},
            dockedItems: [
                {
                    xtype: 'pagingtoolbar',
                    dock: 'bottom',
                    displayInfo: true,
                    store: studestore
                }
            ]


        });
        me.callParent(arguments);
    }
});
