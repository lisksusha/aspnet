﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoryList.ascx.cs" 
   Inherits="WebApplication1.Controls.CategoryList" %>

<%= CreateHomeLinkHtml() %>

<% foreach (string category in GetCategories()) {
       Response.Write(CreateLinkHtml(category));       
}%>