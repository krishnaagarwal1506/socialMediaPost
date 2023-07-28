<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="Post" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post</title>
    <style>
    .instagram-post {
      width: 100%;
      max-width: 600px;
      margin: 0 auto;
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 20px;
    }

    .post-header {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
    }

    .profile-pic {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      margin-right: 10px;
    }

    .username {
      font-size: 1.2rem;
      margin: 0;
    }
    .likes,
    .location {
      font-size: 0.8rem;
      margin: 0;
      color: #777;
    }

    .post-image {
      width: 100%;
      margin-bottom: 10px;
    }
    .post-footer {

    }

    .actions {
      display: flex;
      justify-content: flex-start;
      gap: 15px;
    }

    .like-button,
    .share-button,
    .comment-button {
      border: none;
      background-color: transparent;
      cursor: pointer;
      font-size: 1rem;
      color: #777;
      padding: 0;
    }

    .like-button:hover,
    .share-button:hover,
    .comment-button:hover {
      color: #333;
    }
    .textDecoration {
        text-decoration:none;
        color:#000;
    }

  </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sc" runat="server"></asp:ScriptManager>
        <asp:Repeater ID="r1" runat="server">
            <ItemTemplate>
            <asp:UpdatePanel ID="up" runat="server">
                <ContentTemplate>
    <div class="instagram-post">
    <div class="post-header">
      <img src="<%# Eval("profileImage") %>" alt="Profile Picture" class="profile-pic"/>
      <div class="user-info">
        <h2 class="username"  ><asp:LinkButton ID="l1" runat="server" Text='<%#Eval("username") %>' CommandName='<%#Eval("username") %>' OnCommand="l1_click" class="textDecoration"></asp:LinkButton></h2>
        <p class="location"><%# Eval("location") %></p>
      </div>
    </div>
    <img src="<%# Eval("postImage") %>" alt="Post Image" class="post-image"/>
    <div class="post-footer">
      <div class="actions">

         <asp:LinkButton ID="LinkButton1" runat="server" CommandName='<%#Eval("id") %>' Text="Like"  OnCommand="likes_click" class="like-button" >
              
          </asp:LinkButton>
        <button class="comment-button">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" width="24" height="24" s viewBox="0 0 24 24"
            stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M12 20.25c4.97 0 9-3.694 9-8.25s-4.03-8.25-9-8.25S3 7.444 3 12c0 2.104.859 4.023 2.273 5.48.432.447.74 1.04.586 1.641a4.483 4.483 0 01-.923 1.785A5.969 5.969 0 006 21c1.282 0 2.47-.402 3.445-1.087.81.22 1.668.337 2.555.337z" />
          </svg>

        </button>
        <button class="share-button">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" width="24" height="24" viewBox="0 0 24 24"
            stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
            <path stroke-linecap="round" stroke-linejoin="round"
              d="M7.217 10.907a2.25 2.25 0 100 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186l9.566-5.314m-9.566 7.5l9.566 5.314m0 0a2.25 2.25 0 103.935 2.186 2.25 2.25 0 00-3.935-2.186zm0-12.814a2.25 2.25 0 103.933-2.185 2.25 2.25 0 00-3.933 2.185z" />
          </svg>

        </button>
      </div>
        <div class="likes"><%# Eval("likes") %></div>
    </div>
  </div>

                    </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="LinkButton1" EventName="Command" />
                </Triggers>
                </asp:UpdatePanel>
                </ItemTemplate>
            </asp:Repeater>
    </form>
</body>
</html>
    