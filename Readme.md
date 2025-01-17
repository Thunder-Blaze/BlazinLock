<div align = center>
  <a href="https://github.com/Thunder-Blaze/BlazinLock">
    <img alt="Logo" src="./assets/Logo.png">
  </a>
  <img src=https://img.shields.io/github/last-commit/Thunder-Blaze/BlazinLock?&style=for-the-badge&color=FFB1C8&logoColor=D9E0EE&labelColor=292324)/> <img src=https://img.shields.io/github/stars/Thunder-Blaze/BlazinLock?style=for-the-badge&logo=andela&color=FFB686&logoColor=D9E0EE&labelColor=292324)/> <img src=https://img.shields.io/github/repo-size/Thunder-Blaze/BlazinLock?color=CAC992&label=SIZE&logo=googledrive&style=for-the-badge&logoColor=D9E0EE&labelColor=292324)/> <img src=https://img.shields.io/badge/issues-skill-green?style=for-the-badge&color=CCE8E9&logoColor=D9E0EE&labelColor=292324)/>
</div>
<br>
<a id="introduction"></a>  
<div align="center">
A Modern HyprLock Theme which is compatible with End4dots, Hyprdots adn Default Hyprland Installations
</div>
<br>

### Easy to Use and Has the following Features
* Music Widget
* Time Widget
* PFP Widget along with Username and Hostname
* Battery Widget
* Modern Looking Input Box
* Auto Color Pallete generation for End4 and Hyprdots
* HyprLock Config Creation using Various Methords
  * Screenshot with End4 (Ags) Material Color Scheme
  * Current Wallpaper with End4 (Ags) Material Color Scheme
  * Screenshot with Hyprdots (Waybar) Color Scheme
  * Current Wallpaper with Hyprdots (Waybar) Color Scheme
  * Default Screenshot
  * Custom Image (Any Custom Image can be set as Hyprlock bg but it is not yet included in the Installer, you can run this manually)

<br>
<div align="center">
  <a href="#introduction"><kbd> <br> Introduction <br> </kbd></a>&ensp;&ensp;
  <a href="#installation"><kbd> <br> Installation <br> </kbd></a>&ensp;&ensp;
  <a href="#styles"><kbd> <br> Styles <br> </kbd></a>&ensp;&ensp;
</div>

<br>
<div align="center"><img width="12%" src="./assets/Arch.svg"/></div>
<br>

<a id="installation"></a>  
<img src="./assets/Installation.gif" width="200"/>
---

> [!CAUTION]
> The script modifies your `hyprland` config to enable BlazinLock on Super + L Keybind.

To install, execute the following commands:

```shell
git clone https://github.com/Thunder-Blaze/BlazinLock/ ~/BlazinLock
cd ~/BlazinLock
chmod +x installer.sh
./installer.sh
```

Please reboot or relogin after the install script completes.

> [!INFO]
> If the BlazinLock is not getting triggered by Default even after choosing yes in Installer
> Manually set it to default by following the given instructions

### Hyprdots
- In `.config/hypr/keybindings.conf`, replace `swaylock` with `blazinlock -s`
- you can replace -s with the type of lock you want

### End-4 Dots
- In `.config/hypr/hyprlock/keybinds.conf`, replace `loginctl lock-session` with `blazinlock -s`
- you can replace -s with the type of lock you want

### Normal Installations
- add this line to your `.config/hypr/hyprlock.conf`
- you can replace -s with the type of lock you want
```shell
bind = $mainMod, L, exec, blazinlock -s
```

> [!IMPORTANT]
> Please note that any hyprlock configurations you had will be overwritten.
> However, all replaced configs are backed up and may be recovered from `~/.config/hyde/hyprlock.conf.backup` and `~/.config/hyde/hyprlock.backup/`.

<a id="styles"></a>  
<img src="./assets/Styles.gif" width="200"/>
---

<table width="100%">
  <tr>
    <th><div align="center">blazinlock -ew</div></th>
    <th><div align="center">blazinlock -es</div></th>
  <tr>
  <tr>
    <td><img src="./assets/blazinlockew.png" width="100%"></td>
    <td><img src="./assets/blazinlockes.png" width="100%"></td>
  <tr>
  <tr>
    <th><div align="center">blazinlock -hw</div></th>
    <th><div align="center">blazinlock -hs</div></th>
  </tr>
  <tr>
    <td><img src="./assets/blazinlockhw.png" width="100%"></td>
    <td><img src="./assets/blazinlockhs.png" width="100%"></td>
  
  </tr>
  <tr>
    <th><div align="center">blazinlock -i "path"</div></th>
    <th><div align="center">blazinlock -s</div></th>
  </tr>
  <tr>
    <td><img src="./assets/blazinlocki.png" width="100%"></td>
    <td><img src="./assets/blazinlocks.png" width="100%"></td>
  </tr>
<table>


## CUSTOMIZING PFP
After Installation, goto "~/.config/hyde/hyprlock"
Replace the pfp.jpg with the image you want as your PFP

> [!IMPORTANT]
> The only File types that are currently supported are JPG, PNG and WEBP.


## RESOURCES
Special Thanks to 
In-saiyan's [hyprlock-config](https://github.com/In-Saiyan/hyprlock-config)
ashish-kus's [hyprlock.conf](https://gist.github.com/ashish-kus/dd562b0bf5e8488a09e0b9c289f4574c)
