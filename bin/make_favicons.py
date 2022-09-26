from favicons import Favicons
from pathlib import Path

favicon_dir = "assets/favicons/"
base_favicon = favicon_dir+"rsg/rsg_fav_base.png"
generated_dir = favicon_dir+"temp/"

p = Path(generated_dir)
p.mkdir(parents=True, exist_ok=True)

#genterates favicons into a temp directory
with Favicons(base_favicon, generated_dir) as favicons:
    favicons.generate()
