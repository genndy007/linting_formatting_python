echo "Running black and mypy"
for file_path in $(git diff --cached --name-only); do
  [[ "$file_path" =~ ^.*\.py$ ]] && black --check $file_path && mypy $file_path
done
echo "Running flake8"
flake8
echo "Running isort check imports"
isort --check-only .
exit 0