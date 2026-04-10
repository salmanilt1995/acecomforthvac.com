import os

target_dir = r"d:\xampp\htdocs\projects\acecomforthvac.com"
target_str = "Ace%20Comfort%20Logo.jpg"
ignored_dirs = {".git", "scratch", "images"}

for root, dirs, files in os.walk(target_dir):
    dirs[:] = [d for d in dirs if d not in ignored_dirs]
    for file in files:
        if file.endswith((".html", ".css", ".js")):
            file_path = os.path.join(root, file)
            try:
                with open(file_path, "r", encoding="utf-8") as f:
                    for i, line in enumerate(f, 1):
                        if "logo" in line.lower() and target_str not in line:
                            # Trim leading whitespace for brevity
                            print(f"{file_path}:{i}: {line.strip()}")
            except Exception as e:
                pass
