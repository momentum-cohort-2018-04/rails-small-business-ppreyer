# Really Small Business Website

## Description

Faust Furniture is a local vintage furniture retailer with a constantly changing selection. Their showroom has limited floor space so they built a website to show all their inventory.

They only need static pages to show what products they currently have -- no e-commerce options. But they've had trouble maintaining the site because they can't easily synchronize the items on the page with the continuously changing items in stock.

They keep good records in an Excel spreadsheet, and want to keep doing that. But they would like an easier way to keep their website up to date as their inventory changes.

Your task is to create a Rails app that generates static pages of Faust Furniture's current inventory based on data imported from a `.csv` file.

## MVP

There should be 3 types of pages: the home page, a page that shows all available products, and a single-product detail page. Your Rails app should handle the routing, controller logic, and view rendering.

1. Create a `Product` class with attributes matching the CSV file headers.
2. Create a method that identifies items on clearance and adjusts the price.
    - Apply a 10% discount on the price for items that are in 'good' condition.
    - Apply a 20% discount on the price for items that are in 'average' condition.
    - For each clearance item on the page, make sure that the site indicates that the item is on clearance (next to the price, for instance).
3. Do not show items on the site that have a quantity of 0.

The website should be deployed to Heroku, and a link to the live site should be included with your homework repo.

## Application design tips

1. You don't need all the CRUD functions in this application, and you do not need to persist anything to a database. Since you only have two pages, you only need two controller actions: one for the list (or index) page and the second for the detail (or show) page.
2. You do need to fetch the data from the csv in the controller each time the page is rendered. The csv file is the source of data for your website.

### Sidenote: what is up with this csv file?

The csv file will live inside your application, but in a real-world scenario, it might be uploaded to a server you could access. Faust Furniture employees keep their Excel spreadsheet updated and export and upload an updated csv file frequently. Each time you render a page, you need to fetch up-to-date data from that csv file.

### Extra Challenges

If you get to MVP and have more time, here are some suggestions to keep going.

1. Organize the items by furniture category on the product list page.
2. On the home page, show the furniture categories as options that the user can select. When they navigate from the home page to the product list page after selecting an option, they will only see items of the category they selected.
    * _e.g. if a user selects 'tables', they will only see the items that are in the 'tables' category_

## Resources

- Images, CSV file, and a background image are included in the zip file in this repo
- [Ruby standard library CSV](https://ruby-doc.org/stdlib-2.5.0/libdoc/csv/rdoc/CSV.html)
- [Video Prep](https://vimeo.com/139012189)
