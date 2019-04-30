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

To generate a mosaic for your image, name it `image.png` and put it into `volume/`.

If you want to use your own images as tiles, put them into `volume/library/`,
otherwise top ~250 hive.one avatars for bitcoin category is used.

Once ready, run:

```
docker build -t hodlonaut .
docker run -it --rm -v $(pwd)/volume/:/data/ hodlonaut
```

Generated pictures can be found at `volume/outputs/`.
