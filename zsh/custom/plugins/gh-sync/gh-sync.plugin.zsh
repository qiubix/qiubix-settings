gh-sync() {
  # Ensure we're in a git repo
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "❌ Not inside a git repository."
    return 1
  fi

  # Extract full origin URL (works for both SSH and HTTPS)
  origin_url=$(git remote get-url origin 2>/dev/null)
  echo "$origin_url"

  if [[ -z "$origin_url" ]]; then
    echo "❌ No remote 'origin' found."
    return 1
  fi

  # Extract "user/repo" from URL
  if [[ "$origin_url" =~ github\.com[:/](.*)/(.*)(\.git)?$ ]]; then
    user="${match[1]}"
    repo="${match[2]}"
    repo="${repo%.git}"
  else
    echo "❌ Could not parse GitHub repo from: $origin_url"
    return 1
  fi

  echo "🔄 Syncing fork: $user/$repo (branch: main)..."
  gh repo sync "$user/$repo" -b main
}
