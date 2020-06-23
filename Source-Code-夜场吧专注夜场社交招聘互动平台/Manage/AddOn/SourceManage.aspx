<%@ Page Language="C#" MasterPageFile="~/Manage/I/Default.master" AutoEventWireup="true" CodeBehind="SourceManage.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.SourceManage" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server"><title>来源管理</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
<div class="btn-group marginbot10">
<a href="AddSource.aspx" class="btn btn-primary" >添加来源</a>
<a href="Author.aspx"  class="btn btn-primary" >添加作者</a>
<a href="AddKeyWord.aspx"  class="btn btn-primary" >添加关键字</a>
</div>
<div class="clearfix"></div>
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="td_xs">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" title="" value='<%#Eval("ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="序号" HeaderStyle-CssClass="td_s"></asp:BoundField>
            <asp:TemplateField HeaderText="来源名称">
                <ItemTemplate>
                    <a href="AddSource.aspx?Action=Modify&SId=<%#Eval("ID")%>"><%# DataBinder.Eval(Container.DataItem,"Name")%></a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="是否启用" HeaderStyle-CssClass="td_m">
                <ItemTemplate>
                    <%#(bool)Eval("Passed") == false ? "<span style=\"color: #ff0033\">×</span>" : "√"%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" HeaderStyle-CssClass="td_l">
                <ItemTemplate>
                    <a href='AddSource.aspx?Action=Modify&SId=<%# Eval("ID")%>' class="option_style"><i class="fa fa-pencil" title="修改"></i></a>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del1" CommandArgument='<%# Eval("ID") %>' CssClass="option_style"><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
    </ZL:ExGridView>
    <div>
        <asp:Button ID="btndelete" Style="width: 110px;" class="btn btn-primary" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" Text="删除选定来源" OnClick="btndelete_Click" />&nbsp;&nbsp;
            <input name="Cancel" type="button" class="btn btn-primary" id="Cancel" value="添加一个新来源" onclick="javascript: window.location.href = 'AddSource.aspx'" />
    </div>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script>
    $().ready(function () {
        $("#Egv tr").dblclick(function () {
            var id = $(this).find(".sid").text();
            if (id) {
                location = "AddSource.aspx?Action=Modify&SId=" + id;
            }
        });
    });
</script>
</asp:Content>