// Ext.onReady(function () {
//      Ext.Loader.setConfig({enabled:true});
//     Ext.create('app.view.main.main',{
//     });
// });

Ext.onReady(function(){
    Ext.onReady(function(){
        var form1 = Ext.create('Ext.form.Panel', {
            renderTo: Ext.getBody(),
            width: 700,
            method: 'POST',
            layout: 'anchor',
            title: 'Ext编辑器',
            items: [{
                xtype: 'htmleditor',
                anchor: '100%',
                name: 'content',
                height: 250,
                enableFont: false
            }, {
                xtype: 'panel',
                anchor: '100%',
                title: '编辑的内容',
                height: 250,
                html: '<div id="viewcontent"></div>'
            }],
            bbar: [{
                xtype: 'tbfill'
            }, {
                xtype: 'button',
                text: '确定',
                disabled: true,
                formBind: true,
                listeners: {
                    click: function(){
                        var thisForm = form1.getForm();
                        thisForm.submit({
                            url: "formSubmit.php",
                            success: function(form, action){
                                Ext.getDom("viewcontent").innerHTML = action.result.msg;
                            }
                        });
                    }
                }
            }, {
                xtype: 'tbfill'
            }]
        });
    })
});
