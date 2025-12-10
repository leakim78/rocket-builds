# Quick Start Guide

Get started with the Rocket game in under 2 minutes!

## Prerequisites

You need Java Runtime Environment (JRE) 8 or higher installed.

### Check Java Installation

```bash
java -version
```

If Java is not installed, download it from:
- [AdoptOpenJDK](https://adoptopenjdk.net/)
- [Oracle Java](https://www.oracle.com/java/technologies/downloads/)
- [Amazon Corretto](https://aws.amazon.com/corretto/)

## Download

### Option 1: From Releases Page

1. Go to the [Releases](../../releases/latest) page
2. Download the latest `rocket-*.jar` file
3. Save it to your preferred location

### Option 2: Using Command Line

**Linux/macOS:**
```bash
# Download the latest release (replace URL with actual release)
curl -L -o rocket.jar "https://github.com/leakim78/rocket-builds/releases/latest/download/rocket.jar"
```

**Windows PowerShell:**
```powershell
# Download the latest release (replace URL with actual release)
Invoke-WebRequest -Uri "https://github.com/leakim78/rocket-builds/releases/latest/download/rocket.jar" -OutFile "rocket.jar"
```

## Run

Open a terminal/command prompt in the directory containing the JAR file and run:

```bash
java -jar rocket-*.jar
```

Or with a specific file name:
```bash
java -jar rocket-v1.0.0.jar
```

## Troubleshooting

### "No main manifest attribute"

The JAR file might be corrupted. Try downloading it again.

### "Unsupported class file major version"

Your Java version is too old. Upgrade to Java 8 or higher.

### "Could not find or load main class"

The JAR file path might be incorrect. Ensure you're in the correct directory.

### Performance Issues

You can allocate more memory to Java:

```bash
# Allocate 2GB of RAM
java -Xmx2G -jar rocket.jar

# Allocate 512MB of RAM (for systems with limited memory)
java -Xmx512M -jar rocket.jar
```

## Getting Help

- Check the game's documentation (if included in the JAR)
- Visit the [main rocket repository](https://github.com/leakim78/rocket)
- Open an issue if you find a bug

## Next Steps

- Explore game features
- Check for updates regularly
- Join the community (if available)

---

**Enjoy playing Rocket! 🚀**
