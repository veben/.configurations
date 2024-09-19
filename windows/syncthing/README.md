# Syncthing installation and configuration
> See: https://docs.syncthing.net/intro/getting-started.html

## Installation
- Download the **Base Syncthing** package for your processor architecture from the [official Syncthing downloads page](https://syncthing.net/downloads/)
- Extract the downloaded zip file (e.g.: `syncthing-windows-amd64-v1.27.12.zip`)
- Move the extracted folder to your preferred location (e.g., `C:\Program Files`)
## Launching
- Run `syncthing.exe` from the installed directory.
- If the web interface doesn't open automatically, navigate to `http://127.0.0.1:8384/` in your web browser.
## Configuration
### Adding a Remote Device (e.g., your phone)
- Open the Syncthing application on your phone.
- Click "Add Remote Device".
- Scan the QR code displayable on the Windows application.
- Set a name for the device and enable "Auto Accept".
### Setting Up a Shared Folder
- In the Windows Syncthing web interface, remove the "Default Folder" if present.
- Click "Add Folder" and configure as follows:
  - Folder Path: `C:\Users\<YourUsername>\second_brain`
  - Folder Label: `second_brain`
- Share this folder with your other devices as needed.
### Autostart Configuration
To have Syncthing start automatically with Windows:
- Navigate to `C:\Users\<YourUsername>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`.
- Right-click and select "New > Shortcut".
- Enter the following command, adjusting the path to match your Syncthing installation:
```text
"C:\Program Files\syncthing-windows-amd64-v1.27.12\syncthing.exe" -no-console -no-browser
```
- Name the shortcut and click "Finish".

## Configuration
- https://docs.syncthing.net/
- https://docs.syncthing.net/intro/getting-started.html