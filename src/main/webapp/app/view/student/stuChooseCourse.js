Ext.define('app.view.student.stuChooseCourse', {
    id: "stuChooseCourse",
    extend: 'Ext.grid.Panel',
    xtype: 'view-student-stuChooseCourse',
    requires: ["app.view.courseMg.entityCourseBaseInfo"],
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

        var entityCourseStore = Ext.create('Ext.data.Store', {
            id: 'entityCourseStore',
            autoLoad: true,
            // fields: ['stuName', 'age', 'sex'],
            pageSize: 15, // 每页的条目数量
            proxy: {
                type: 'ajax',
                url: 'entityCourse/queryChooseCouList',
                reader: {
                    type: 'json',
                    rootProperty: 'rows',
                    totalProperty: "total"
                }
            }
        });

        var paramStore = Ext.create('Ext.data.Store', {
            fields: ['name'],
            autoLoad: true,
            data: [
                {'name': '课程编号', 'value': 'id'},
                {'name': '课程名称', 'value': 'couName'}
            ]
        });

        Ext.apply(me, {
            tbar: {
                layout: 'column',
                scope: me,
                items: [
                    {
                        xtype: 'toolbar',
                        columnWidth: 1,
                        scope: me,
                        itemId: 'search',
                        style: 'border: 1px solid blue;background:#AFCEE3;',
                        items: [
                            {
                                xtype: 'button', text: '添加到我的课程', scope: me, glyph: 'xf234@FontAwesome',
                                accessUrl: 'createAccount',
                                itemId: 'bt_create',
                                handler: function () {
                                    var selectData = me.getSelectionModel().getSelection();
                                    if (selectData.length != 1) {
                                        Ext.Msg.alert('温馨提示', '请选择一条操作数据');
                                        return;
                                    }
                                    me.addCourse(selectData[0]);
                                }
                            },
                            '->',
                            {
                                xtype: 'combobox',
                                emptyText: '请选择',
                                store: paramStore,
                                editable: false,
                                displayField: 'name',
                                valueField: 'value',
                                labelWidth: 60,
                                width: 200,
                                itemId: 'searchCom'
                            },
                            {
                                xtype: 'textfield',
                                emptyText: '请输入',
                                labelWidth: 60,
                                width: 220,
                                itemId: 'searchContent'
                            },
                            {
                                xtype: 'button', text: '搜索', scope: me, glyph: 'xf002@FontAwesome',
                                handler: function () {
                                    var searchCom = me.queryById("searchCom").getValue();
                                    var searchContent = me.queryById("searchContent").getValue();

                                    var params = {};
                                    params[searchCom] = searchContent;

                                    me.store.load({
                                        params: params
                                    });
                                }
                            },
                            {
                                xtype: 'button', text: '重置', scope: me, glyph: 'xf0e2@FontAwesome',
                                handler: function () {
                                    me.query("#searchCom")[0].setValue(null);
                                    me.query("#searchContent")[0].setValue(null);

                                }
                            }
                        ]
                    }
                ]
            },
            border: true,
            store: entityCourseStore,
            title: me.config.tabtitle,
            columnLines: true,
            closable: true,
            viewConfig: {
                enableTextSelection: true
            },
            columns: [
                {text: '课程id', dataIndex: 'id', width: '10%', align: 'center'},
                {text: '课程名称', dataIndex: 'couName', width: '14%', align: 'center'},
                {text: '上课地点', dataIndex: 'location', width: '15%', align: 'center'},
                {text: '开始日期', dataIndex: 'strDate', width: '10%', align: 'center'},
                {text: '结束日期', dataIndex: 'endDate', width: '10%', align: 'center'},
                {text: '星期', dataIndex: 'week', width: '10%', align: 'center'},
                {text: '时间', dataIndex: 'claTime', width: '10%', align: 'center'},
                {text: '授课教师', dataIndex: 'tName', width: '10%', align: 'center'},
                {text: '课程状态', dataIndex: 'status', width: '10%', align: 'center'},

            ],
            listeners: {},
            dockedItems: [
                {
                    xtype: 'pagingtoolbar',
                    dock: 'bottom',
                    displayInfo: true,
                    store: entityCourseStore
                }
            ]


        });
        me.callParent(arguments);
    },

    //详情窗口
    addCourse: function (selectData) {
        Ext.Ajax.request({
            url: 'gradeMg/addCourse',
            params: {'id': selectData.get('id')},
            method: 'POST',
            success: function (response, options) {
                var response = JSON.parse(response.responseText);
                if (response.success) {
                    var result = response.result;
                    Ext.Msg.alert("系统提示", result);
                } else {
                    Ext.Msg.alert("系统提示", response.message);
                }

            },
            failure: function (response) {
                Ext.Msg.alert("系统提示", "请求超时");
            }
        });
    },
});
