---
description: "Use when creating, updating, reviewing, or renumbering architecture decision records (ADRs). Covers documenting decisions, preserving history, and keeping the ADR index in sync."
name: "ADR Guidelines"
applyTo: "**/adr/**/*.md"
---
# Architecture Decision Record Guidelines

- Follow the project's [ADR index](../../adr/README.md) and its linked template for naming, format, and contribution guidance.
- Create ADRs for significant architectural decisions, not routine implementation details. Record the decision with the change it concerns when possible.
- Keep each ADR focused on one decision. Describe its context and problem, meaningful alternatives, the chosen option with evidence-based rationale, and material positive and negative consequences.
- Do not invent historical discussions or motivations. When documenting an existing decision whose original rationale is unknown, derive the rationale from the implementation and current requirements, and say that it is reconstructed.
- Use the next sequential four-digit number in the filename and ADR title. Keep filenames short and descriptive in kebab-case. Keep the index's Decisions list in numerical order and link every record using a relative path.
- Preserve the decision history. Do not silently rewrite an accepted decision when it changes; add a new ADR explaining the change and linking to the superseded record.
- Keep records concise, remove unused template placeholders, and verify filenames, numbering, and relative links after editing.
