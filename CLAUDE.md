# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LaTeX-based TCC (Trabalho de Conclusão de Curso / Thesis) project using the UNIAVAN template, based on abntex2 class. The thesis topic is "Uma arquitetura baseada em microsserviços centrada na observabilidade" (A microservices-based architecture focused on observability).

**Author:** Matheus Gustavo Coppi da Silva
**Advisor:** Prof. Luiz Fernando Arruda, Msc
**Institution:** Centro Universitário Avantis (UNIAVAN)
**Course:** Sistemas de informação
**Expected Defense:** May 28, 2025

## Implementation Project

**Location:** `/Users/matheusgcoppi/Development/golang/ProjectTCC2`

This directory contains the practical implementation of the thesis research, focusing on a **comparison between REST and gRPC** communication protocols in a microservices architecture.

### Implementation Details
- **Language:** Go (Golang)
- **Purpose:** Comparative analysis of REST vs gRPC performance, scalability, and observability
- **Architecture:** Microservices-based implementation
- **Key Comparisons:**
  - Communication efficiency (REST vs gRPC)
  - Performance metrics
  - Observability integration
  - Protocol-specific characteristics

When working on the thesis development chapter (Chapter 3 or later chapters about implementation), refer to this project directory for:
- Code examples and implementation details
- Performance test results
- Architecture diagrams based on actual implementation
- Real-world observations from the comparison

## Building the Document

### Compile the PDF
```bash
latexmk -pdf main.tex
```

### Clean build artifacts
```bash
latexmk -c
```

### Full clean (including PDF)
```bash
latexmk -C
```

## Project Structure

### Core Files
- `main.tex` - Main document file that orchestrates all components
- `references.bib` - Bibliography in BibTeX format

### Configuration Directory (`setup/`)
- `information.tex` - Document metadata (author, title, advisor, course details, etc.)
- `list_of_acron_symbols.tex` - Acronyms, abbreviations, and symbols definitions
- `my_packages.tex` - Custom LaTeX packages to include
- `uniavan.cls` - Custom UNIAVAN document class (based on abntex2)
- `logo.png` - Institution logo

### Content Directories
- `beforetext/` - Pre-textual elements:
  - `resumo.tex` - Abstract in Portuguese
  - `abstract.tex` - Abstract in English
  - `agradecimentos.tex` - Acknowledgments (optional)
  - `epigrafe.tex` - Epigraph (optional)
  - `aprovacao.tex` - Approval page (optional)

- `chapters/` - Main content chapters:
  - `01-chapter.tex` - Introduction
  - `02-chapter.tex` - Theoretical foundation / Literature review
  - `03-chapter.tex` - Development/Implementation (in progress)
  - `04-chapter.tex` - Results and analysis (planned)
  - `05-chapter.tex` - Conclusion (planned)

- `aftertext/` - Post-textual elements (appendices and annexes)

- `images/` - All figures and images used in the document
  - Contains technical diagrams: microservices, monoliths, Docker, Kubernetes, gRPC, REST, observability, circuit breaker, etc.

## Document Configuration

### Modifying Document Metadata
Edit `setup/information.tex` to change:
- Author name
- Title and subtitle
- Advisor/Co-advisor
- Defense date
- Institution details
- Course information

### Adding Chapters
1. Create new chapter file in `chapters/` directory (e.g., `03-chapter.tex`)
2. Add `\input{chapters/03-chapter.tex}` to `main.tex` in the ELEMENTOS TEXTUAIS section (around line 217-221)
3. Chapters are automatically included in the table of contents

### Managing References
- Add new references in BibTeX format to `references.bib`
- Cite in text using `\cite{reference_key}`
- Bibliography is automatically generated and formatted according to ABNT standards

### Adding Acronyms and Symbols
Edit `setup/list_of_acron_symbols.tex` to add new entries. Lists are automatically generated.

### Including Images
1. Place image files in the `images/` directory
2. Reference in LaTeX using standard figure environment:
```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.8\textwidth]{images/filename.png}
  \caption{Caption text}
  \label{fig:label}
\end{figure}
```

## Document Features

- **Language:** Portuguese (Brazil) with English support
- **Citation Style:** ABNT (Brazilian standards)
- **Bibliography Backend:** biber (using biblatex)
- **Font Size:** 12pt
- **Line Spacing:** 1.5 (OnehalfSpacing)
- **Paper Size:** A4
- **Page Layout:** One-sided (oneside)

## Automatic Elements

The following are generated automatically:
- Table of contents (Sumário)
- List of figures (Lista de figuras)
- List of tables (Lista de tabelas)
- List of abbreviations and acronyms (Lista de siglas)
- List of symbols (Lista de símbolos)
- Bibliography (Referências)

## Git Status Note

The repository shows several modified LaTeX build artifacts (`.log`, `.aux`, `.pdf`, etc.). These are generated files and typically should be in `.gitignore`. Only source files (`.tex`, `.bib`, images) should be version controlled.

## Current Work Focus

The thesis is currently in the development/implementation phase:

- **Chapter 1 (Introduction)** - Complete
- **Chapter 2 (Theoretical Foundation)** - Complete
  - Covers microservices architecture, observability pillars, communication protocols (REST, gRPC), and related concepts
- **Chapter 3 (Development/Implementation)** - IN PROGRESS
  - Focus: Documenting the REST vs gRPC comparison implementation
  - Reference implementation at: `/Users/matheusgcoppi/Development/golang/ProjectTCC2`
  - Topics to cover:
    - Architecture design decisions
    - Implementation methodology
    - Technology stack and tools used
    - Development environment setup
    - Microservices structure
    - REST and gRPC implementations
    - Observability integration
- **Chapter 4 (Results and Analysis)** - Planned
  - Comparative analysis of REST vs gRPC
  - Performance metrics and benchmarks
  - Observability insights
- **Chapter 5 (Conclusion)** - Planned

### Key Research Focus

The work focuses on microservices architecture with emphasis on:
- **Primary Research Goal:** Comparative analysis of REST and gRPC communication protocols
- Observability in distributed systems
- Monolithic vs. microservices architecture
- Kubernetes orchestration
- Distributed tracing and logging
- Circuit breaker patterns
- Three pillars of observability (monitoring, logging, tracing)

## Working with the Implementation

When adding content about the development/implementation to the thesis:

1. **Access the implementation project:**
   ```bash
   cd /Users/matheusgcoppi/Development/golang/ProjectTCC2
   ```

2. **Extract relevant information:**
   - Code structure and organization
   - Configuration files
   - API definitions (REST endpoints, gRPC proto files)
   - Performance test results
   - Observability setup (metrics, logs, traces)

3. **Document in LaTeX:**
   - Add code snippets using `\begin{lstlisting}` environment
   - Include architecture diagrams from the implementation
   - Reference specific files and their purposes
   - Explain design decisions and trade-offs

4. **Maintain consistency:**
   - Ensure implementation aligns with theoretical foundation (Chapter 2)
   - Use consistent terminology between code and thesis
   - Cross-reference implementation details with observability concepts
