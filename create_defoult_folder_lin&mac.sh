#!/bin/bash

# Prompt user for directory name
read -p "Enter directory name (one word): " dirName

# Create the directory
mkdir -p "$dirName"

# Navigate to the directory
cd "$dirName" || exit

# Open the directory in Finder/Explorer
if [[ "$OSTYPE" == "darwin"* ]]; then
    open .
else
    xdg-open .
fi

# Create open_vs_code.sh
cat <<EOL > open_vs_code.sh
#!/bin/bash
code .
exit
EOL
chmod +x open_vs_code.sh

# Create open_vs_and_html.sh
cat <<EOL > open_vs_and_html.sh
#!/bin/bash
open index.html
code .
exit
EOL
chmod +x open_vs_and_html.sh

# Create index.html
cat <<EOL > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Document</title>
</head>
<body>
    <script src="index.js"></script>
</body>
</html>
EOL

# Create index.js
touch index.js

# Create style.css
touch style.css

# Open the directory in VS Code
code .

exit