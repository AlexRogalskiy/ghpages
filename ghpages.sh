PREVIOUS_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ -z "$(git status --porcelain)" ]; then 
  # Working directory clean
  echo "Deploying gh-pages..."
  git checkout gh-pages
  git merge master --no-edit
  npm run build
  git add .
  git commit -m 'new build'
  git push origin gh-pages
  git checkout $PREVIOUS_BRANCH
else 
  # Uncommitted changes
  echo "Uncommitted git changes! Deploy failed."
fi