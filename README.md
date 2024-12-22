# Entity and Relationship Analysis in Judicial Texts

This project is a natural language processing system developed in Prolog, designed to extract entities and relationships from texts, particularly legal texts. It uses a model of entities and relationships to identify and visualize key information contained in a discourse.

## Features

- Definition of entities such as people, places, organizations, and objects.
- Support for synonyms to improve the accuracy of entity recognition.
- Extraction of relationships between entities.
- Visualization of the found entities and relationships in a readable format.

## Code Structure

- **Entities**: Definition of the entities involved in the system.
- **Synonyms**: Mapping of synonyms to enhance entity recognition.
- **Relationships**: Definition of relationships between entities.
- **Extraction**: Rules for extracting entities and relationships from a text.
- **Visualization**: Functions to display the extracted entities and relationships.
- **Example**: An example of usage to demonstrate the system's functionality.

## Usage

1. **Installation**: Make sure you have a Prolog interpreter installed on your system. You can use SWI-Prolog, which is free and open-source.

2. **Execution**:
   - Clone this repository to your computer:
     ```bash
     git clone https://github.com/your-username/repo-name.git
     ```
   - Navigate to the project folder:
     ```bash
     cd repo-name
     ```
   - Start the Prolog interpreter:
     ```bash
     swipl
     ```
   - Load the file containing the code:
     ```prolog
     ?- [file_name].
     ```
   - Run the provided example:
     ```prolog
     ?- example.
     ```

## Example Text

The system is designed to analyze texts such as the following:
