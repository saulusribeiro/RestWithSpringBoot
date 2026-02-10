#!/bin/bash

OLD_PACKAGE="br.com.erudio"
NEW_PACKAGE="br.com.srdeveloper"
SOURCE_DIR="src"  # ou "src/main/java" se for Maven/Gradle

# 1. Substituir nos arquivos .java
find $SOURCE_DIR -type f -name "*.java" -print0 | while IFS= read -r -d '' file; do
    echo "Atualizando $file"
    sed -i "s|$OLD_PACKAGE|$NEW_PACKAGE|g" "$file"
done

# 2. Renomear os diretórios de pacotes
OLD_DIR=$(echo "$OLD_PACKAGE" | tr '.' '/')
NEW_DIR=$(echo "$NEW_PACKAGE" | tr '.' '/')

echo "Renomeando diretórios:"
find $SOURCE_DIR -type d -path "*/$OLD_DIR*" | while read oldpath; do
    newpath=$(echo "$oldpath" | sed "s|$OLD_DIR|$NEW_DIR|")
    echo "  $oldpath → $newpath"
    mkdir -p "$(dirname "$newpath")"
    mv "$oldpath" "$newpath"
done
