# Cómo subir este repo a GitHub

## Opción A — Script (recomendado)

```bash
cd manual-copilot-studio-apl6006
./publicar.sh                       # crea el repo público "manual-copilot-studio-apl6006"
./publicar.sh mi-repo private       # o con otro nombre / privado
```

Requisitos: `git` y [GitHub CLI](https://cli.github.com) (`gh auth login` la primera vez).

## Opción B — Con GitHub Copilot CLI

Abre una terminal en la carpeta del repo, ejecuta `copilot` y pega este prompt:

```text
Inicializa este folder como repositorio git en la rama main, haz el primer commit con todos
los archivos y crea un repositorio público en mi cuenta de GitHub llamado
manual-copilot-studio- con la descripción "Manual  para el
Microsoft Applied Skills: Compilación de un agente en Microsoft Copilot Studio: Build an agent in Microsoft Copilot Studio". Haz push y agrega los
topics copilot-studio, microsoft-applied-skills, ai-agents.
```

## Opción C — Comandos manuales

```bash
git init -b main
git add .
git commit -m "Manual for dummies: Applied Skills APL-6006 (Copilot Studio)"
gh repo create manual-copilot-studio-apl6006 --public --source . --remote origin --push
```

> En Windows (PowerShell) usa la opción B o C; el script `publicar.sh` corre en macOS, Linux o Git Bash.
