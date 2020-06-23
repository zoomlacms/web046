UE.registerUI('myblockquote', function (editor, uiName) {
    editor.registerCommand(uiName, {
        execCommand: function () {
            this.execCommand('blockquote', {
                "style": "border-left: 3px solid #E5E6E1; margin-left: 0px; padding-left: 5px; line-height:20px;"
            });
        }
    });
    var btn = new UE.ui.Button({
        name: uiName,
        title: '自定义引用',
        cssRules: "background-position: -220px 0;",
        onclick: function () {
            editor.execCommand(uiName);
        }
    });
    editor.addListener('selectionchange', function () {
        // console.log(this);
        var state = editor.queryCommandState('blockquote');
        if (state == -1) {
            btn.setDisabled(true);
            btn.setChecked(false);
        } else {
            btn.setDisabled(false);
            btn.setChecked(state);
        }
    });

    return btn;
});