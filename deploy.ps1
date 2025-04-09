zola build
git worktree add ../gh-pages gh-pages
xcopy public\* ..\gh-pages\ /E /H /Y
cd ../gh-pages
git add .
git commit -m "Deploy update"
git push
cd ../my-blog
git worktree remove ../gh-pages
