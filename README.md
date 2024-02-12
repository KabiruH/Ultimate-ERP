# Ultimate Supply Chain ERP

Ultimate Supply Chain ERP is an Integrated Management System tailored for Wholesale, Distribution, and Retail businesses. The system is built on open architecture allowing for scalability, flexible customization that meet unique requirements with user-friendly interfaces.
Requirements

This application is designed to fulfill the following requirements:

    Run multiple branches/Locations.
    MPESA integration.
    Manage multiple stores (stock transfer between and within stores).
    Integrate Point of Sale with Financial Module.
    Generate financial reports:
        Trial Balance
        Profit and Loss
        Statement of Financial Position
        Statement of cash flows
        VAT Analysis
    Manage sales reps.
    Generate profitability reports per product, sales rep, branch, etc.
    Manage Van-Selling/Field Sales.
    Manage Accounts Payable:
        Purchase Quotation
        Purchase Order
        Goods Received Note
        Vendor Invoice
        Payment Voucher
        Cheque Posting
        Vendor account balances
        Vendor statement of account
    Customer Management:
        Create Customer accounts
        Create customer profiles (Regions)
        Manage customer credit limits
        Customer rating/Credit History
    Manage Accounts Receivable:
        Sales Quotation
        Sales Order
        Delivery Note
        Customer Invoice
        Customer Receipt
        Customer account balances
        PD Cheques notifications
        Customer account statements
    Products Management
    Keep track of Inventory
    Journals:
        Credit Note
        Debit Note
        Stock journal
    Sales Analysis Reports
    Customer Balances
    Multiple payment options
    Track your assets
        

## Technologies Used

    Frontend: React
    Backend: Ruby on Rails
    Database: SQLite3

## Installation

    Clone this repository:

bash

        git clone git@github.com:KabiruH/Ultimate-ERP.git

Navigate to the project directory:

bash

        cd ultimate-supply-chain-erp

## Install dependencies for both frontend and backend:

bash

    # Install frontend dependencies
            cd frontend
            npm install

    # Install backend dependencies
            cd ../backend
            bundle install

## Configuration

    Ensure that you have Node.js, React, Ruby, Rails, and SQLite3 installed on your system.

    Configure the database settings in the Rails backend. You can find the configuration file at backend/config/database.yml.

    Set up any additional configurations required for MPESA integration and other third-party services.

## Usage

Start the Rails server for the backend:

    bash

        cd backend
        rails server

Start the React development server for the frontend:

bash

        cd frontend
        npm start

    Access the application in your web browser at http://localhost:3000.

## Contributing

Contributions are welcome! Please follow the contribution guidelines outlined in the repository.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.