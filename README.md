<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ADM HACKER — Secure VPN Portal</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,Helvetica,sans-serif;
}

body{
    min-height:100vh;
    color:#fff;
    background:#020409;
    overflow-x:hidden;
}

/* Animated cyber background */
body::before{
    content:"";
    position:fixed;
    inset:0;
    background:
        radial-gradient(circle at 20% 20%,rgba(0,255,255,.14),transparent 25%),
        radial-gradient(circle at 80% 30%,rgba(120,0,255,.14),transparent 25%),
        radial-gradient(circle at 50% 90%,rgba(0,255,140,.10),transparent 30%);
    z-index:-3;
}

.grid{
    position:fixed;
    inset:0;
    z-index:-2;
    opacity:.25;
    background-image:
        linear-gradient(rgba(0,255,255,.12) 1px,transparent 1px),
        linear-gradient(90deg,rgba(0,255,255,.12) 1px,transparent 1px);
    background-size:45px 45px;
    animation:gridMove 12s linear infinite;
}

@keyframes gridMove{
    from{transform:translateY(0)}
    to{transform:translateY(45px)}
}

.particle{
    position:fixed;
    width:3px;
    height:3px;
    background:#00ffff;
    border-radius:50%;
    box-shadow:0 0 12px #00ffff;
    animation:float 7s infinite ease-in-out;
    opacity:.7;
}

.p1{left:10%;top:30%}
.p2{left:25%;top:70%;animation-delay:1s}
.p3{left:70%;top:20%;animation-delay:2s}
.p4{left:85%;top:65%;animation-delay:3s}
.p5{left:50%;top:45%;animation-delay:4s}

@keyframes float{
    0%,100%{transform:translateY(0);opacity:.2}
    50%{transform:translateY(-70px);opacity:1}
}

.container{
    width:min(1100px,92%);
    margin:auto;
}

/* Header */
header{
    padding:22px 0;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.logo{
    font-size:25px;
    font-weight:900;
    letter-spacing:3px;
    color:#00ffff;
    text-shadow:0 0 15px rgba(0,255,255,.8);
}

.status{
    display:flex;
    align-items:center;
    gap:8px;
    font-size:12px;
    color:#8dffcf;
}

.status-dot{
    width:9px;
    height:9px;
    background:#00ff88;
    border-radius:50%;
    box-shadow:0 0 12px #00ff88;
}

/* Hero */
.hero{
    text-align:center;
    padding:55px 15px 30px;
}

.badge{
    display:inline-block;
    padding:7px 14px;
    border:1px solid rgba(0,255,255,.4);
    border-radius:30px;
    color:#00ffff;
    background:rgba(0,255,255,.05);
    font-size:11px;
    letter-spacing:2px;
    margin-bottom:20px;
}

h1{
    font-size:clamp(42px,9vw,82px);
    letter-spacing:5px;
    line-height:1;
    margin-bottom:18px;
    background:linear-gradient(90deg,#fff,#00ffff,#a855f7,#fff);
    background-size:300%;
    -webkit-background-clip:text;
    color:transparent;
    animation:titleMove 6s linear infinite;
}

@keyframes titleMove{
    0%{background-position:0}
    100%{background-position:300%}
}

.subtitle{
    color:#9da9b8;
    font-size:15px;
    letter-spacing:2px;
}

/* Main card */
.card{
    max-width:650px;
    margin:30px auto;
    padding:30px;
    border:1px solid rgba(0,255,255,.18);
    background:rgba(7,12,22,.78);
    backdrop-filter:blur(18px);
    border-radius:24px;
    box-shadow:
        0 0 50px rgba(0,255,255,.08),
        inset 0 0 30px rgba(255,255,255,.02);
}

.card-title{
    text-align:center;
    font-size:20px;
    margin-bottom:8px;
}

.card-subtitle{
    text-align:center;
    color:#788696;
    font-size:13px;
    margin-bottom:25px;
}

.key-box{
    display:flex;
    gap:10px;
}

.key-box input{
    flex:1;
    min-width:0;
    padding:16px;
    border-radius:12px;
    border:1px solid #233342;
    outline:none;
    color:#fff;
    background:#03070d;
    font-size:14px;
}

.key-box input:focus{
    border-color:#00ffff;
    box-shadow:0 0 15px rgba(0,255,255,.15);
}

button{
    border:0;
    cursor:pointer;
    color:#001011;
    font-weight:800;
}

.verify{
    padding:0 20px;
    border-radius:12px;
    background:#00ffff;
    box-shadow:0 0 20px rgba(0,255,255,.3);
}

.verify:hover{
    transform:translateY(-1px);
    box-shadow:0 0 30px rgba(0,255,255,.5);
}

.message{
    min-height:22px;
    text-align:center;
    margin-top:14px;
    font-size:13px;
}

/* VPN status */
.vpn-panel{
    display:none;
    margin-top:25px;
    padding:22px;
    border-radius:18px;
    background:rgba(0,255,150,.04);
    border:1px solid rgba(0,255,150,.2);
}

.vpn-panel.show{
    display:block;
}

.vpn-status{
    display:flex;
    align-items:center;
    justify-content:center;
    gap:10px;
    color:#00ff9d;
    margin-bottom:15px;
}

.pulse{
    width:12px;
    height:12px;
    border-radius:50%;
    background:#00ff9d;
    box-shadow:0 0 0 0 rgba(0,255,157,.7);
    animation:pulse 1.5s infinite;
}

@keyframes pulse{
    70%{
        box-shadow:0 0 0 14px rgba(0,255,157,0);
    }
    100%{
        box-shadow:0 0 0 0 rgba(0,255,157,0);
    }
}

.info{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:10px;
    margin:18px 0;
}

.info div{
    padding:12px;
    background:#050b12;
    border-radius:10px;
    border:1px solid #172431;
}

.info small{
    display:block;
    color:#697887;
    margin-bottom:4px;
}

.disconnect{
    width:100%;
    padding:13px;
    border-radius:10px;
    background:#ff3155;
    color:#fff;
    box-shadow:0 0 20px rgba(255,49,85,.2);
}

/* Social */
.social{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:12px;
    margin-top:25px;
}

.social a{
    text-decoration:none;
    color:#fff;
    padding:16px 8px;
    text-align:center;
    border:1px solid #1a2937;
    border-radius:15px;
    background:rgba(255,255,255,.025);
    transition:.2s;
}

.social a:hover{
    transform:translateY(-4px);
    border-color:#00ffff;
    box-shadow:0 0 20px rgba(0,255,255,.15);
}

.social-icon{
    display:block;
    font-size:25px;
    margin-bottom:6px;
}

.social-name{
    font-size:11px;
    color:#aab7c4;
}

/* Owner */
.owner{
    max-width:650px;
    margin:25px auto 60px;
    text-align:center;
    padding:30px;
    border-radius:22px;
    border:1px solid rgba(150,80,255,.18);
    background:rgba(10,8,20,.65);
}

.avatar{
    width:85px;
    height:85px;
    margin:auto auto 15px;
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:30px;
    background:radial-gradient(circle,#222,#050509);
    border:2px solid #9b5cff;
    box-shadow:0 0 30px rgba(155,92,255,.35);
}

.owner h2{
    margin-bottom:8px;
}

.owner p{
    color:#82909e;
    line-height:1.7;
    font-size:13px;
}

/* Music */
.music{
    position:fixed;
    right:18px;
    bottom:18px;
    z-index:10;
}

.music button{
    width:50px;
    height:50px;
    border-radius:50%;
    background:#07131a;
    border:1px solid #00ffff;
    color:#00ffff;
    box-shadow:0 0 20px rgba(0,255,255,.2);
}

/* Footer */
footer{
    text-align:center;
    color:#526170;
    font-size:11px;
    padding:0 0 25px;
}

/* Mobile */
@media(max-width:600px){
    header{
        padding:18px 0;
    }

    .logo{
        font-size:19px;
    }

    .hero{
        padding-top:35px;
    }

    .card{
        padding:20px;
    }

    .key-box{
        flex-direction:column;
    }

    .verify{
        padding:14px;
    }

    .social{
        grid-template-columns:1fr 1fr;
    }

    .info{
        grid-template-columns:1fr;
    }
}
</style>
</head>

<body>

<div class="grid"></div>

<div class="particle p1"></div>
<div class="particle p2"></div>
<div class="particle p3"></div>
<div class="particle p4"></div>
<div class="particle p5"></div>

<div class="container">

<header>
    <div class="logo">ADM HACKER</div>

    <div class="status">
        <span class="status-dot"></span>
        SYSTEM ONLINE
    </div>
</header>

<section class="hero">

    <div class="badge">SECURE VPN PORTAL</div>

    <h1>ADM HACKER</h1>

    <p class="subtitle">
        SECURE • PRIVATE • FAST • RELIABLE
    </p>

</section>

<section class="card">

    <h2 class="card-title">Access Secure Network</h2>

    <p class="card-subtitle">
        Enter your authorized VPN access key
    </p>

    <div class="key-box">

        <input
            id="keyInput"
            type="password"
            placeholder="Enter your VPN Key"
            autocomplete="off"
        >

        <button class="verify" onclick="verifyKey()">
            VERIFY
        </button>

    </div>

    <div id="message" class="message"></div>

    <div id="vpnPanel" class="vpn-panel">

        <div class="vpn-status">
            <span class="pulse"></span>
            <strong>VPN SESSION ACTIVE</strong>
        </div>

        <div class="info">

            <div>
                <small>STATUS</small>
                Connected
            </div>

            <div>
                <small>PROTOCOL</small>
                WireGuard
            </div>

            <div>
                <small>ENCRYPTION</small>
                Secure Tunnel
            </div>

            <div>
                <small>SESSION</small>
                <span id="timer">00:00:00</span>
            </div>

        </div>

        <button class="disconnect" onclick="disconnectVPN()">
            DISCONNECT VPN
        </button>

    </div>

    <div class="social">

        <a href="https://instagram.com/" target="_blank">
            <span class="social-icon">◎</span>
            <span class="social-name">INSTAGRAM</span>
        </a>

        <a href="https://wa.me/" target="_blank">
            <span class="social-icon">◉</span>
            <span class="social-name">WHATSAPP</span>
        </a>

        <a href="tel:+0000000000">
            <span class="social-icon">☎</span>
            <span class="social-name">PHONE</span>
        </a>

        <a href="https://t.me/" target="_blank">
            <span class="social-icon">➤</span>
            <span class="social-name">TELEGRAM</span>
        </a>

    </div>

</section>

<section class="owner">

    <div class="avatar">ADM</div>

    <h2>About the Owner</h2>

    <p>
        Welcome to ADM HACKER.
        This platform is designed with a modern cyber interface
        and secure network-access experience.
        All website information, social links and platform settings
        can later be managed from the protected administrator panel.
    </p>

</section>

<footer>
    © 2026 ADM HACKER — All Rights Reserved
</footer>

</div>

<!-- Music button -->
<div class="music">
    <button onclick="toggleMusic()" id="musicBtn">♫</button>
</div>

<!--
     Replace this with your own audio file later.
-->
<audio id="backgroundMusic" loop>
    <!-- Example:
    <source src="music.mp3" type="audio/mpeg">
    -->
</audio>

<script>

/* =====================================================
   DEMO KEY VERIFICATION
   IMPORTANT:
   Real keys must be verified on a secure backend.
   Never store real VPN secrets in frontend JavaScript.
   ===================================================== */

const DEMO_KEYS = [
    "ADM-CYBER-9921-X7",
    "ADM-VIP-8842-K1",
    "ADM-STEALTH-4410-Q9"
];

let sessionSeconds = 0;
let timerInterval = null;

function verifyKey(){

    const input =
        document.getElementById("keyInput").value.trim();

    const message =
        document.getElementById("message");

    const panel =
        document.getElementById("vpnPanel");

    if(!input){

        message.textContent =
            "Please enter your VPN key.";

        message.style.color = "#ffbf4b";

        return;
    }

    if(DEMO_KEYS.includes(input)){

        message.textContent =
            "Key verified successfully.";

        message.style.color = "#00ff9d";

        panel.classList.add("show");

        startTimer();

    }else{

        message.textContent =
            "Invalid or inactive VPN key.";

        message.style.color = "#ff526d";

        panel.classList.remove("show");
    }
}

function startTimer(){

    clearInterval(timerInterval);

    sessionSeconds = 0;

    timerInterval = setInterval(()=>{

        sessionSeconds++;

        const h =
            String(Math.floor(sessionSeconds / 3600))
            .padStart(2,"0");

        const m =
            String(Math.floor((sessionSeconds % 3600) / 60))
            .padStart(2,"0");

        const s =
            String(sessionSeconds % 60)
            .padStart(2,"0");

        document.getElementById("timer").textContent =
            `${h}:${m}:${s}`;

    },1000);
}

function disconnectVPN(){

    clearInterval(timerInterval);

    document.getElementById("vpnPanel")
        .classList.remove("show");

    document.getElementById("message").textContent =
        "VPN session disconnected.";

    document.getElementById("message").style.color =
        "#ff526d";

}

/* Music */
let musicPlaying = false;

function toggleMusic(){

    const music =
        document.getElementById("backgroundMusic");

    const button =
        document.getElementById("musicBtn");

    if(!music.src){

        alert(
            "Add your music file or audio URL in the <audio> section first."
        );

        return;
    }

    if(musicPlaying){

        music.pause();

        button.textContent = "♫";

        musicPlaying = false;

    }else{

        music.play();

        button.textContent = "❚❚";

        musicPlaying = true;
    }
}

</script>

</body>
</html>
