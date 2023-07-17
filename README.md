# CGIBlog

CGIBlog is just a tiny template for static blogs. HTML pages are generated starting from Markdown files, and deployment is done through a one-line rsync command.

## Usage

1. Create Markdown posts in the `posts` folder. Just copy paste the template and write your articles.
2. Put your images into the `images` folder, then link them into your posts. Again, refer to the post template to see how.
3. Run the `build.sh` script to turn your Markdown posts into HTML pages. It will also rebuild the home page and the sitemap.
4. Run `push.sh` to deploy to your server. It uses rsync, therefore modify it to make sure it'll connect fine to your server.

Once you have your HTML pages on your server, simply serve the blog using Nginx, Apache or whatever WebServer you like. You can find an NGINX virtual host template on the `nginx` folder.
