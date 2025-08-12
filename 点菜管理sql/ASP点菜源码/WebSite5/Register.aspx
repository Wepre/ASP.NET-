<%@ Page Title="" Language="C#" MasterPageFile="~/InernetSaleMainStyle.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <style type="text/css">
        .style17
        {
            width: 256px;
        }
    .style18
    {
        width: 256px;
        height: 24px;
    }
    .style19
    {
        height: 24px;
    }
    .style24
    {
        width: 405px;
    }
    .style27
    {
        width: 516px;
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:100%;">
        <tr>
            <td class="style24" style="text-align: right">
                用户名</td>
            <td style="text-align: left" class="style27">
                <asp:TextBox ID="TxtAccount" runat="server" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TxtAccount" Display="Dynamic" ErrorMessage="*请输入账号" 
                    ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style24" style="text-align: right">
                密码</td>
            <td style="text-align: left" class="style27">
                <asp:TextBox ID="TxtPwd" runat="server" MaxLength="25" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TxtPwd" Display="Dynamic" ErrorMessage="*请输入密码" 
                    ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style24" style="text-align: right">
                确认密码</td>
            <td style="text-align: left" class="style27">
                <asp:TextBox ID="TxtRePwd" runat="server" MaxLength="25" TextMode="Password" 
                    ontextchanged="TxtRePwd_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TxtRePwd" Display="Dynamic" ErrorMessage="*请输入确认密码" 
                    ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TxtPwd" ControlToValidate="TxtRePwd" Display="Dynamic" 
                    ErrorMessage="*两次密码不一致" ForeColor="Red" ValidationGroup="1"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style24" style="text-align: right">
                手机号码</td>
            <td style="text-align: left" class="style27">
                <asp:TextBox ID="TxtTel" runat="server" MaxLength="11"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TxtTel" Display="Dynamic" ErrorMessage="*请输入电话" 
                    ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="TxtTel" Display="Dynamic" ErrorMessage="电话格式错误！" 
                    ForeColor="Red" 
                    ValidationExpression="(13[0-9]|15[0-9]|18[0-9]|17[06-8]|14[57])\d{8}" 
                    ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style24" style="text-align: right">
                收货地址</td>
            <td style="text-align: left" class="style27">
                <asp:TextBox ID="TxTAdress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="TxTAdress" ErrorMessage="*收货地址不能为空,此为初始默认地址！" 
                    ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style24" style="text-align: right">
                验证码</td>
            <td style="text-align: left" class="style27">
                <asp:TextBox ID="TxtCheck" runat="server" MaxLength="6"></asp:TextBox>
                &nbsp;<asp:TextBox ID="yanzhengma" runat="server" Height="16px" ReadOnly="True" 
                    Width="32px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="TxtCheck" Display="Dynamic" ErrorMessage="*请输入验证码" 
                    ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            &nbsp;<asp:CompareValidator ID="CompareValidator4" runat="server" 
                    ControlToCompare="yanzhengma" ControlToValidate="TxtCheck" Display="Dynamic" 
                    ErrorMessage="*验证码错误！" ForeColor="Red" ValidationGroup="1"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style24" style="text-align: right; vertical-align: top;">
                协议</td>
            <td style="text-align: left" class="style27">
                <asp:TextBox ID="TxtPolicy" runat="server" Height="136px" TextMode="MultiLine" 
                    Width="342px">尊敬的用户：您好！
注册本网站，您需要了解以下内容：
1．本网站服务条款的确认和接纳
　　本网站的各项网络服务的所有权和运营权归《吃了么网》所有。本网站依照本服务条款及不时发布的操作规则提供网络服务，此外，当服务使用者（以下称“用户”）使用本网站各项分类服务时，用户应当同意本服务条款的全部内容并遵守与该项服务相关的规则与要点。前述所有规则与要点均构成本服务条款的一部分。用户必须完全同意所有服务条款并完成注册程序，才能成为本网站的正式用户。
 
2. 服务说明
　　本网站网络服务的具体内容由本网站根据实际情况提供。
本网站仅为用户提供相关的网络服务。用户必须自行配备上网所需设备（如个人电脑、手机、调制解调器或其他必备上网装置）及所需费用（如上网所支付的与此服务有关的电话费用、 网络费用、手机费用等）。
 
3．用户在本网站上交易平台上不得实施下列行为：
     (1) 用户在使用本网站服务时必须符合中国有关法规以及其他有关国家和地区的法律规定以及国际法的有关规定。用户不得利用本网站制作、发表、复制、传送、传播、储存等以下信息：
         a) 反对宪法所确定的基本原则的；
         b) 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；
         c) 损害国家荣誉和利益的；
         d) 煽动民族仇恨、民族歧视，破坏民族团结的；
         e) 破坏国家宗教政策，宣扬邪教和封建迷信的；
         f) 散布谣言，扰乱社会秩序，破坏社会稳定的；
         g) 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；
         h) 含有虚假、有害、胁迫、侵害他人隐私、粗俗、猥亵、骚扰、侵害、中伤、侮辱或者诽谤他人，其他有悖道德、令人反感的内容；
          i) 煽动非法集会、结社、游行、示威、聚众扰乱社会秩序的；
          j) 以非法民间组织名义活动的；
         k) 侵犯他人知识产权、商业秘密或其他合法权利的；
          l) 含有法律、行政法规禁止的其他内容的。
   (2) 用户不得利用本网站服务误导、欺骗他人。
   (3) 未经本网站书面同意，用户不得从事以下活动：
         a) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；
         b) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；
         c) 故意制作、传播计算机病毒等破坏性程序的；
         d) 其他危害计算机信息网络安全的行为。
   (4) 用户不得以任何方式干扰本网站的服务。
   (5) 用户不得进行任何危害计算机网络安全的行为，包括但不限于：
         a) 使用未经许可的数据或进入未经许可的服务器/账户；
         b) 未经允许进入公众计算机网络或者他人计算机系统并删除、修改、增加存储信息；
         c) 未经许可，企图探查、扫描、测试本&quot;软件&quot;系统或网络的弱点或其它实施破坏网络安全的行为；
         d) 企图干涉、破坏软件系统或网站的正常运行，故意传播恶意程序或病毒以及其他破坏干扰正常网络信息服务的行为；
         e) 伪造TCP/IP数据包名称或部分名称。
 
4． 有关个人资料
　　用户保证，在用户完成注册程序或以其他本网站允许的方式实际使用网站服务时，用户应当是具备完全民事权利能力和完全民事行为能力的自然人、法人或其他组织。用户同意：
   (1) 提供及时、详尽及准确的个人资料；
   (2) 同意接收来自本网站的信息；
   (3) 不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料；
   (4) 在不对外披露单个用户隐私资料的前提下，本网站有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。
 
5． 用户隐私制度
　　尊重用户个人隐私是本网站的一项基本政策。所以，本网站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容，除非有法律许可要求或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的：
   (1) 用户授权本网站透露这些信息；
   (2)遵守有关法律规定，遵从本网站合法服务程序。如果用户提供的资料包含有不正确的信息，本网站保留结束用户使用本网站信息服务资格的权利；
   (3)保持维护本网站的合法权益；
   (4)在紧急情况下竭力维护用户个人和社会大众的隐私安全；
   (5)符合其他相关的要求。
本网站保留发布会员人口分析咨询的权利。
 
6． 服务条款的修改
　　本网站有权在必要时修改服务条款，本网站服务条款一旦发生变动，将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的本网站信息服务。如果用户继续享用本网站信息服务，则视为接受服务条款的变动。本网站保留随时修改或中断服务而不需通知用户的权利。本网站行使修改或中断服务的权利，不需对用户或第三方负责。
　　本网站定义的网络服务内容包括 ：本网站提供的文字、软件、声音、图片、图表、广告中的全部内容以及本网站为用户提供的其他信息。所有这些内容受版权、商标和/或其它财产所有权法律的保护。所以，用户只能在本网站和相关权利人授权下才能使用这些内容，而不能擅自复制、发布、转载、播放、改编、汇编或以其他方式使用这些内容或将该等内容用于其他任何商业目的。
 
7． 用户的帐号、密码和安全性
　　你一旦注册成功成为用户，你将得到一个密码和帐号。每个用户都要对其帐户中的所有活动和事件负全责。你可随时根据指示改变你的密码，也可以结束旧的帐户重开一个新帐户。用户同意：
   (1)用户将对用户名和密码安全承担全部责任。用户可随时根据提示改变用户的密码。用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用或存在安全漏洞的情况，应立即通知本网站。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，本网站不承担任何责任；
   (2)如用户注册的免费网络服务的帐号在任何连续30日内未实际使用，或者用户注册的收费网络服务的帐号在其订购的收费网络服务的服务期满之后连续30日内未实际使用，则本网站有权删除该帐号并停止为该用户提供相关的网络服。
 
8． 免责声明
　　用户同意对本网站网络服务的使用承担全部风险，并对因其使用本网站网络服务而产生的一切后果承担全部风险，本网站对用户不作任何类型的担保，也不承担任何责任。 本网站不担保网络服务一定能满足用户的要求，也不担保网络服务不会中断，对服务的及时性、安全性、准确性都不作担保。对于因不可抗力或本网站不能避免或控制的原因造成的网络服务中断或其它缺陷，本网站不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。
　　本网站对任何直接、间接、偶然、特殊及继起的损害不负责任，这些损害来自：不正当使用本网站服务，或用户传送的信息不符合规定等。这些行为都有可能导致本网站形象受损，所以本网站事先提出这种损害的可能性，同时会尽量避免这种损害的发生。
 
9． 信息的储存及限制
　　本网站有判定用户的行为是否符合本网站服务条款的要求和精神的权利，如果用户违背本网站服务条款的规定，本网站有权中断其服务的帐号。
 
10．链接
　　本网站内设有通往其他网站和网页的链接，但这些网站和网页并非由本网站经营或控制，本网站不承担责任。用户启动任何此类链接或网页，离开本网站网站进入其他网站或网页，所有风险自负，本网站不承担一切责任和债务。
 
11．损害赔偿责任
　　用户同意保障和维护本网站及其他用户的利益，如因用户违反有关法律、法规或本服务条款的任何条款而给本网站或其他任何第三人造成损失，用户同意承担由此造成的损害赔偿责任。
 
12．保障
　　用户同意保障和维护本网站全体成员的利益，负责支付由用户使用超出服务范围引起的律师费用，违反服务条款的损害补偿费用，其它人使用用户的电脑、帐号和其它知识产权的追索费。
 
13．结束服务
　　用户或本网站可随时根据实际情况中断一项或多项服务。本网站不需对任何个人或第三方负责而随时中断服务。用户若反对任何服务条款的建议或对后来的条款修改有异议，或对本网站服务不满，用户可以行使如下权利：
   (1) 不再使用本网站信息服务；
   (2) 通知本网站停止对该用户的服务。
　　结束用户服务后，用户使用本网站服务的权利马上中止。从那时起，用户没有权利，本网站也没有义务传送任何未处理的信息或未完成的服务给用户或第三方。
 
14．通告
　　所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。
　　用户在注册时应当选择稳定性及安全性相对较好的电子邮箱，并且同意接受并阅读本网站发往用户的各类电子邮件。如用户未及时从自己的电子邮箱接受电子邮件或因用户电子邮箱或用户电子邮件接收及阅读程序本身的问题使电子邮件无法正常接收或阅读的，只要本网站成功发送了电子邮件，应当视为用户已经接收到相关的电子邮件。电子邮件在发信服务器上所记录的发出时间视为送达时间。
 
15．信息内容的所有权
　　本网站定义的信息内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；本网站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本网站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。
 
16．法律
　　本服务条款的订立、执行和解释及争议的解决均应适用中国法律并受中国法院管辖。如本服务条款与中华人民共和国法律相抵触时，则该等条款将按法律规定重新修订，而其它条款则依旧有效并具有法律效力。 如双方就本服务条款内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向本网站所在地的人民法院提起诉讼。
 
17．其他规定
　　本服务条款中的标题仅为方便而设，在解释本服务条款时应被忽略。</asp:TextBox>
                <br />
                <asp:CheckBox ID="CBAgree" runat="server" Text="同意此条款" />
            </td>
        </tr>
        <tr>
            <td class="style24" style="text-align: right; vertical-align: top;">
                &nbsp;</td>
            <td style="text-align: left" class="style27">
                <asp:Button ID="BtnRgister" runat="server" Text="注册新用户" 
                    onclick="BtnRgister_Click" ValidationGroup="1" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnReset" runat="server" Text="重置" onclick="BtnReset_Click" 
                    ValidationGroup="2" />
            </td>
        </tr>
    </table>
    
</asp:Content>

