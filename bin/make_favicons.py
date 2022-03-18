from favicons import Favicons

favicon_dir = "assets/favicons/rsg/"
base_favicon = favicon_dir+"rsg_fav_base.png"

with Favicons(base_favicon, favicon_dir) as favicons:
    favicons.generate()