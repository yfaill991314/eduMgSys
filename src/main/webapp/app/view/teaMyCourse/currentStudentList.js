Ext.define('app.view.teaMyCourse.currentStudentList', {
    id: "currentStudentList",
    extend: 'Ext.grid.Panel',
    xtype: 'view-teaMyCourse-currentStudentList',
    requires: [],
    padding: "10px 10px 0 10px",
    config: {},
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
            // autoLoad: true,
            // fields: ['stuName', 'age', 'sex'],
            pageSize: 15, // 每页的条目数量
            proxy: {
                type: 'ajax',
                url: 'gradeMg/findStudentGradeListByCurrentCourse',
                reader: {
                    type: 'json',
                    rootProperty: 'rows',
                    totalProperty: "total"
                }
            }
        });

        Ext.apply(me, {
            border: true,
            store: studestore,
            // columnLines: true,
            // closable: true,
            viewConfig: {
                enableTextSelection: true
            },
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
                                xtype: 'button', text: '评分', scope: me, glyph: 'xf234@FontAwesome',
                                accessUrl: 'createAccount',
                                itemId: 'bt_giveMark',
                                handler: function () {
                                    var selectData = me.getSelectionModel().getSelection();
                                    if (selectData.length != 1) {
                                        Ext.Msg.alert('温馨提示', '请选择一条操作数据');
                                        return;
                                    }
                                    me.giveMark(selectData[0]);
                                }
                            },
                            '->',
                        ]
                    }
                ]
            },
            columns: [
                {text: '学号', dataIndex: 'stu_id', width: '10%', align: 'center'},
                {text: '姓名', dataIndex: 'stu_name', width: '10%', align: 'center'},
                {text: '学院', dataIndex: 'college', width: '18%', align: 'center'},
                {text: '专业', dataIndex: 'profession', width: '20%', align: 'center'},
                {text: '年级', dataIndex: 'in_sch_year', width: '10%', align: 'center'},
                {text: '班级', dataIndex: 'stu_class', width: '11%', align: 'center'},
                {text: '性别', dataIndex: 'sex', width: '10%', align: 'center'},
                {text: '成绩', dataIndex: 'grade', width: '10%', align: 'center'}
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
    },
    giveMark: function (selectData) {
        Ext.create("Ext.window.Window", {
            title: '学生成绩信息',
            modal: true,
            layout: 'fit',
            width: '70%',
            height: '70%',
            items: [
                {
                    xtype: "form",
                    layout: 'column',
                    id: 'stuGradeInfo',
                    items: [
                        {
                            xtype: 'textfield',
                            fieldLabel: '学号',
                            labelWidth: 60,
                            columnWidth: .3,
                            name: 'stuNum',
                            readOnly: true,
                            emptyText: '学号自动生产',
                            itemId: 'stuNum',
                            margin: '10 0 0 50',
                            readOnly: true
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '姓名',
                            allowBlank: false,
                            blankText: '姓名必填',
                            labelWidth: 60,
                            name: 'stuName',
                            itemId: 'stuName',
                            columnWidth: .3,
                            margin: '10 0 0 50',
                            readOnly: true
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '入校学年',
                            allowBlank: false,
                            blankText: '入校学年必填',
                            labelWidth: 60,
                            name: 'inSchYear',
                            itemId: 'inSchYear',
                            columnWidth: .3,
                            margin: '10 0 0 50',
                            readOnly: true
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '学院',
                            allowBlank: false,
                            blankText: '学院必填',
                            labelWidth: 60,
                            name: 'college',
                            itemId: 'college',
                            columnWidth: .3,
                            margin: '10 0 0 50',
                            readOnly: true
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '专业',
                            allowBlank: false,
                            blankText: '专业必填',
                            labelWidth: 60,
                            name: 'profession',
                            itemId: 'profession',
                            columnWidth: .3,
                            margin: '10 0 0 50',
                            readOnly: true
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '班级',
                            allowBlank: false,
                            blankText: '班级必填',
                            labelWidth: 60,
                            name: 'stuClass',
                            itemId: 'stuClass',
                            columnWidth: .3,
                            margin: '10 0 0 50',
                            readOnly: true
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '年龄',
                            allowBlank: false,
                            blankText: '年龄必填',
                            labelWidth: 60,
                            columnWidth: .3,
                            name: 'age',
                            itemId: 'age',
                            margin: '10 0 0 50',
                            readOnly: true
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '性别',
                            allowBlank: false,
                            blankText: '性别必填',
                            labelWidth: 60,
                            name: 'sex',
                            itemId: 'sex',
                            columnWidth: .3,
                            margin: '10 0 0 50',
                            readOnly: true
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '电话号码',
                            allowBlank: false,
                            blankText: '电话号码必填',
                            labelWidth: 60,
                            name: 'phoneNum',
                            itemId: 'phoneNum',
                            columnWidth: .3,
                            margin: '10 0 0 50',
                            readOnly: true
                        },
                        {
                            xtype: 'textfield',
                            fieldLabel: '成绩',
                            labelWidth: 60,
                            name: 'grade',
                            itemId: 'grade',
                            columnWidth: .3,
                            margin: '10 0 0 50'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: '成绩id',
                            labelWidth: 60,
                            name: 'gradeId',
                            hidden: true,
                            itemId: 'gradeId',
                            columnWidth: .3,
                            margin: '10 0 0 50'
                        },{
                            xtype: 'textfield',
                            fieldLabel:'课程id',
                            labelWidth: 60,
                            name: 'eCourseId',
                            hidden: true,
                            itemId: 'eCourseId',
                            columnWidth: .3,
                            margin: '10 0 0 50'
                        }
                    ],
                    listeners: {
                        'afterrender': function (cmp) {
                            Ext.Ajax.request({
                                url: 'gradeMg/findGradeByGradeId',
                                params: {'id': selectData.get('id')},
                                method: 'POST',
                                success: function (response, options) {
                                    var response = JSON.parse(response.responseText);
                                    if (response.success) {
                                        var result = response.result;
                                        var stuGradeInfo = Ext.getCmp("stuGradeInfo");
                                        stuGradeInfo.getForm().setValues(result);
                                        // var teaCourseBaseInfoFields = teaCourseBaseInfo.getForm().getFields();
                                        // teaCourseBaseInfoFields.each(function (field) {
                                        //     field.setReadOnly(true);
                                        // });

                                    } else {
                                        Ext.Msg.alert("系统提示", response.message);
                                    }

                                },
                                failure: function (response) {
                                    Ext.Msg.alert("系统提示", "请求超时");
                                }
                            });
                        }
                    }
                }],
            fbar: [
                '->',
                {
                    xtype: 'button',
                    text: "保存",
                    itemId: 'save_id',
                    handler: function (btn) {
                        var win = btn.up().up();

                        var formData = win.down('form').getForm().getValues();

                        var grade = {};
                        grade['id'] = formData['gradeId'];
                        grade['grade'] = formData['grade'];
                        Ext.Ajax.request({
                            url: "gradeMg/saveGradeByGradeId",
                            method: 'POST',
                            params: grade,
                            success: function (response, options) {
                                var response = JSON.parse(response.responseText);
                                if (response.success) {
                                    Ext.getCmp("currentStudentList").store.load({
                                            params: {
                                                courseId: formData['eCourseId']
                                            }
                                        }
                                    );
                                    Ext.Msg.alert("系统提示", response.result)
                                }
                                else {
                                    Ext.Msg.alert("系统提示", response.message);
                                }
                            },
                            failure: function (response) {
                                Ext.Msg.alert("系统提示", "请求超时");
                            }
                        });
                    }

                },
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
    }

});
