
Ext.define('app.view.personelMg.teachersMg', {
    id: "teacherMgGrid",
    extend: 'Ext.grid.Panel',
    xtype: 'view-personelMg-teachersMg',
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
                url: 'PersonelMg/queryTeacherList',
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
                {text: '教师号', dataIndex: 'teaNum', width: '20%', align: 'center'},
                {text: '姓名', dataIndex: 'teaName', width: '15%', align: 'center'},
                {text: '学院', dataIndex: 'college', width: '20%', align: 'center'},
                {text: '性别', dataIndex: 'sex', width: '14%', align: 'center'},
                {text: '年龄', dataIndex: 'age', width: '10%', align: 'center'},
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
