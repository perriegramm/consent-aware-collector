📄 Licensed under [Modified MIT License](LICENSE.md) — for personal and educational use only.

📜 See what's new: [Change log](CHANGELOG.md)

🖤 This repo stays free, focused and unfiltered thanks to people who believe visibility is power. [Sponsor me](https://buymeacoffee.com/perriegramm)

# consent-aware-collector
A calm, non-invasive tool to see what’s happening on the computer you use — including camera, mic, and background services. Doesn’t hack, spy, or break rules. Just helps you better understand your digital environment — even on devices managed by others.

Calm visibility for conscious users.

⚖️ Legal Context and Intent

This project was created for educational and personal awareness purposes only.
It is not designed to interfere with, bypass, or compromise any security systems. It does not collect, transmit, or alter data belonging to others. All actions are local, read-only, and initiated by the user.
The tool is meant to support digital literacy, forensic learning, and individual system awareness — especially in environments where users may not fully understand what is running on their device.
This project must only be used in systems where the user is authorized to observe activity. It is not intended for use against third parties, nor for circumvention of corporate policies.

If you are unsure whether you’re allowed to run this — treat it as a learning resource, not a tool for deployment.


🧭 Purpose

consent-aware-collector is a simple, passive tool that helps you see what runs in the background on the computer you use — including camera, microphone, and system services. It’s designed to work even on devices managed by someone else, without breaking any rules.

🎯 The goal: awareness without intrusion.

This project was built for anyone who wants to:
- Feel more confident about their digital environment
- See which system components activate, and when
- Observe without hacking, interfering, or violating trust

It’s a lens, not a lever. A flashlight, not a crowbar.

🔐 What It Does (and Doesn’t)

✅ It does:
- Log when certain processes (e.g. camera/mic controllers) become active
- Capture visible signs of system-level behavior (e.g. sharingd, rapportd, mdmclient)
- Save timestamped logs to a local folder
- Help the user track changes over time, without needing admin rights

❌ It doesn’t:
- Intercept or decrypt data
- Access company files or internal networks
- Evade detection or bypass corporate tools
- Store or exfiltrate any private information

This tool respects boundaries — technical, legal, and ethical.

🛡️ Legal / Ethical Use

This tool is meant for environments where you have a right to observe your own activity. Use only on systems where you are authorized to monitor background behavior. Do not run it on machines you don’t control, or in violation of company policies.

This includes personal laptops, BYOD devices, and even work-issued computers where passive monitoring is allowed (e.g. for accessibility, consent verification, personal reassurance).

It can also support:
- People who want more clarity about what's happening on their device
- Parents or caregivers helping others use computers safely
- Anyone feeling uncertain about how their system behaves

### 🚀 Quick Start
```
git clone https://github.com/yourusername/consent-aware-collector.git
cd consent-aware-collector
chmod +x collector.sh
./collector.sh 
```
Logs are saved to a /logs/ folder with readable timestamps.

### 📁 Output Sample

```
logs/
├── 2025-05-04/
├── 2025-05-06/
│   ├── 17_13/
│   └── 17_50/
│       ├── airdrop_status/
│       ├── bluetooth_watch/
│       ├── clipboard_logger/
│       └── deleted_activity/

```

💬 Why This Exists

Most people have no easy way to see what their computer is doing in the background — especially on devices configured by someone else. This tool offers a lightweight, respectful way to learn what’s happening, without needing admin access or technical deep dives.
It’s not a tool for experts. It’s a tool for anyone who wants digital clarity.


👤 Author

Created by @perriegramm — because informed people make safer systems.

🙏 Acknowledgments

This project exists because learning how systems behave shouldn't require special access or permissions.

It was shaped by:
- The lack of simple, transparent tools for people using managed devices
- A need to verify what's happening, without relying on blind trust
- A desire to build digital literacy and awareness through observation

Not built from fear — but from curiosity, and the belief that understanding is empowering.



This is a personal project, designed with intention. Please do not fork or modify without context.
