# Contact Tracing

## Overview

**Contact Tracing** is a desktop application designed to simulate a contact tracing solution aimed at containing the spread of COVID-19. Developed as part of a university project for the Database exam in 2021, this application uses Java Swing for the user interface and Oracle SQL for data management.

## Features

- **Project Documentation**: Detailed design phases of the application are available in the [Documentazione.pdf](Documentazione.pdf) file in this repository.
- **User Manual**: Instructions on how to use the application effectively can be found in the [UserManual.pdf](UserManual.pdf).

## Technologies Used

- **Java**: Core programming language for the application.
- **Java Swing**: Framework for building the graphical user interface (GUI).
- **Oracle SQL**: Database management system used for data storage and manipulation.

## Installation

To install and run the application:

1. Ensure you have Java Development Kit (JDK) installed on your machine.
2. Set up an Oracle SQL database and configure it with the necessary tables and schema as it follows:

   Procedure to create and populate the database using the scripts in the `/Database` directory:
   1. Execute `DropDatabase.sql` * 
   2. Execute `createDatabase.sql`
   3. Execute `dataEntry.sql`
   
   * This script should only be executed if the database has been previously populated.

3. Clone this repository:
   ```bash
   git clone https://github.com/alepalumbo/contacttracing.git
