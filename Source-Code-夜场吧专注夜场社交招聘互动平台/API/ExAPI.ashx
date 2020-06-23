<%@ WebHandler Language="C#" Class="ExAPI" %>
using System;
using System.Web;
using System.Data;
using ZoomLa.BLL;
using ZoomLa.BLL.User;
using ZoomLa.BLL.API;
using ZoomLa.Model;
using ZoomLa.Common;
using ZoomLa.Components;
using System.Collections.Generic;
using Newtonsoft.Json;
public class ExAPI :API_Base,IHttpHandler
{
    B_User buser = new B_User();
    B_PointGrounp pgBll = new B_PointGrounp();
    public void ProcessRequest(HttpContext context)
    {
        string action = context.Request.Params["action"];
        M_AJAXUser ajaxUser = new M_AJAXUser();
        M_UserInfo mu = buser.GetLogin();
        if (mu.IsNull) { retMod.retmsg = "用户未登录"; RepToClient(retMod); }
        switch (action)
        {
            case "barinfo":
                M_PointGrounp pgMod = pgBll.SelectPintGroup((int)mu.UserExp);
                retMod.result = JsonHelper.AddVal(new string[] { "purse", "point", "pg_name", "pg_icon" },
                     new string[] { mu.Purse.ToString("F0"), mu.UserExp.ToString("F0"), pgMod.GroupName, pgMod.ImgUrl });
                retMod.retcode = M_APIResult.Success;
                break;
            default:
                retMod.retmsg = "接口不存在";
                break;
        }
        RepToClient(retMod);
    }
    public bool IsReusable { get { return false; } }
}