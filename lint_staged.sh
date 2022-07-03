for file_path in $(git diff --cached --name-only); do
  [[ "$file_path" =~ ^.*\.py$ ]] && black --check $file_path && mypy $file_path && flake8 $file_path && isort --check-only $file_path
done
exit 0