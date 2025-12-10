# rocket-builds

Release repository for the rocket game project. This repository distributes pre-built fat-JAR files for easy download and execution.

## 📦 What's Inside

This repository contains fat-JAR (uber-JAR) builds of the rocket game project. Fat-JARs include all dependencies bundled together, making them easy to run without additional setup.

## 🚀 Quick Start

### Download Latest Release

Visit the [Releases](../../releases) page to download the latest fat-JAR file.

### Run the Application

Once downloaded, run the JAR file with:

```bash
java -jar rocket-<version>.jar
```

**Requirements:**
- Java Runtime Environment (JRE) 8 or higher

## 📁 Repository Structure

```
rocket-builds/
├── releases/          # Fat-JAR files organized by version
├── .github/
│   └── workflows/     # Automation workflows for fetching builds
└── README.md          # This file
```

## 🔄 How It Works

This repository uses GitHub Actions to:
1. Monitor the source rocket repository for new releases
2. Fetch built fat-JAR artifacts
3. Create GitHub releases with the JAR files attached
4. Keep this distribution repo synchronized with the main project

## 📋 Version History

Check the [Releases](../../releases) page for a complete version history with release notes.

## 🛠️ For Maintainers

### Manual Upload

To manually add a fat-JAR:

1. Place the JAR file in the `releases/` directory
2. Create a git tag: `git tag v<version>`
3. Push changes: `git push && git push --tags`
4. Create a GitHub release and attach the JAR file

### Automated Workflow

The GitHub Actions workflow automatically:
- Watches for new releases in the rocket repository
- Downloads artifacts
- Creates corresponding releases here
- Attaches JAR files to releases

## 📝 License

This repository follows the same license as the main rocket project.

## 🔗 Links

- Source Repository: [rocket](https://github.com/leakim78/rocket)
- Issues: Report issues in the [main rocket repository](https://github.com/leakim78/rocket/issues)
