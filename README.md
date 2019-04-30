First go to https://hive.one, click "Bitcoin", and scroll the page down until you have enough people loaded.

Then open web console (⌘+alt+j) on mac in chrome.

Paste this:

```jquery
$$('.people-table-user-img').map(v => v.src).join('\n')
```

Copy the output, and save as `avatars.txt`.

Open terminal, `cd` to where you've put `avatars.txt`, and run:

```bash
wget -nv -nc -P raw/avatars -i avatars.txt
```
