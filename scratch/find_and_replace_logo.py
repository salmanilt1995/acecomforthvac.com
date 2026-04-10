import os
import re

target_dir = r"d:\xampp\htdocs\projects\acecomforthvac.com"
new_logo_url = "https://acecomforthvac.com/images/Ace%20Comfort%20Logo.jpg"

# Regex to find img tags with logo-img class and capture their src
# We look for <img followed by any characters including newlines, 
# then class="logo-img" (or similar), and capture the src attribute.
# To be safe, we'll just search for class="logo-img" and then find the preceding src.

log_file = os.path.join(target_dir, "logo_update_log.txt")

with open(log_file, "w") as log:
    for root, dirs, files in os.walk(target_dir):
        for file in files:
            if file.endswith(".html"):
                file_path = os.path.join(root, file)
                with open(file_path, "r", encoding="utf-8") as f:
                    content = f.read()
                
                # Regex to find img with logo-img class
                # This matches <img ... class="..." ... src="..." ... >
                # and vice versa. It handles multi-line tags.
                pattern = re.compile(r'(<img[^>]*class="[^"]*logo-img[^"]*"[^>]*src=")([^"]*)("[^>]*>)', re.IGNORECASE | re.DOTALL)
                
                new_content, count = pattern.subn(rf'\1{new_logo_url}\3', content)
                
                # Also handle cases where src comes before class
                pattern2 = re.compile(r'(<img[^>]*src=")([^"]*)("[^>]*class="[^"]*logo-img[^"]*"[^>]*>)', re.IGNORECASE | re.DOTALL)
                new_content, count2 = pattern2.subn(rf'\1{new_logo_url}\3', new_content)
                
                if count > 0 or count2 > 0:
                    with open(file_path, "w", encoding="utf-8") as f:
                        f.write(new_content)
                    log.write(f"Updated {file_path}: {count + count2} instance(s)\n")

print("Done. Check logo_update_log.txt for details.")
