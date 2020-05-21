
## API Resources

### GET /api/v1/merchants
- Get details of all merchants

Example:
http://localhost:3000/api/v1/merchants

Response:
```
{
  data: [
  {
    id: "1",
    type: "merchant",
    attributes: {
      name: "Schroeder-Jerde",
      updated_at: "2012-03-27T14:53:59.000Z",
      created_at: "2012-03-27T14:53:59.000Z"
    }
  },
  {
    id: "2",
    type: "merchant",
    attributes: {
      name: "Klein, Rempel and Jones",
      updated_at: "2012-03-27T14:53:59.000Z",
      created_at: "2012-03-27T14:53:59.000Z"
    }
  },
  {
    id: "3",
    type: "merchant",
    attributes: {
      name: "Willms and Sons",
      updated_at: "2012-03-27T14:53:59.000Z",
      created_at: "2012-03-27T14:53:59.000Z"
    }
  }
  ...
}
```
### GET /api/v1/merchants/:id
- Get details of a single merchant by ID

Example:
http://localhost:3000/api/v1/merchants/1

Response:
```
{
  data: {
    id: "1",
    type: "merchant",
    attributes: {
      name: "Schroeder-Jerde",
      updated_at: "2012-03-27T14:53:59.000Z",
      created_at: "2012-03-27T14:53:59.000Z"
    }
  }
}
```

### POST /api/v1/merchants
- Create a merchant

Example:
POST http://localhost:3000/api/v1/merchants/1

Response:
```
{
  data: {
    id: "1",
    type: "merchant",
    attributes: {
      name: "Example Merchant",
      updated_at: "2012-03-27T14:53:59.000Z",
      created_at: "2012-03-27T14:53:59.000Z"
    }
  }
}
```
### PATCH /api/v1/merchants/:id
- Update a single merchant's details

Example:
PATCH http://localhost:3000/api/v1/merchants/1

Response:
```
{
  data: {
    id: "1",
    type: "merchant",
    attributes: {
      name: "Schroeder-Jerdé",
      updated_at: "2012-03-27T14:53:59.000Z",
      created_at: "2012-03-27T14:53:59.000Z"
    }
  }
}
```
### DELETE /api/v1/mechants/:id
- Delete a single merchant

Example:
DELETE http://localhost:3000/api/v1/merchants/1

Response:
```
{
  data: {
    id: "1",
    type: "merchant",
    attributes: {
      name: "Schroeder-Jerde",
      updated_at: "2012-03-27T14:53:59.000Z",
      created_at: "2012-03-27T14:53:59.000Z"
    }
  }
}
```

### GET /api/v1/merchants/:id/items 
- Get associated items for a single merchant by ID

Example:
http://localhost:3000/api/v1/merchants/1/items

Response:
```
{
  data: [{
    id: "1",
    type: "item",
    attributes: {
      name: "Item Qui Esse",
      description: "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem    nesciunt assumenda dicta voluptatum porro.",
      unit_price: 751.07,
      merchant_id: 1,
      updated_at: "2012-03-27T14:53:59.000Z",
      created_at: "2012-03-27T14:53:59.000Z",
      merchant:   {
        id: 1,
        name: "Schroeder-Jerde",
        created_at: "2012-03-27T14:53:59.000Z",
        updated_at: "2012-03-27T14:53:59.000Z"
      }
    }
  },
 {
  id: "2",
  type: "item",
  attributes: {
    name: "Item Autem Minima",
    description: "Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.",
    unit_price: 670.76,
    merchant_id: 1,
    updated_at: "2012-03-27T14:53:59.000Z",
    created_at: "2012-03-27T14:53:59.000Z",
    merchant: {
      id: 1,
      name: "Schroeder-Jerde",
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
    }
  }
  ...
}
```

### GET /api/v1/merchants/find?<attribute>=<value>
- Get a single merchant meeting search criteria
### GET /api/v1/merchants/find_all?<attribute>=<value>
- Get all merchants meeting search criteria 
  
### GET /api/v1/merchants/most_revenue?quantity=x
- Get number of merchants ranked by their total revenue
### GET /api/v1/merchants/most_items?quantity=x
- Get number of merchants ranked by total number of items sold
### GET /api/v1/merchants/:id/revenue
- Get revenue for a single merchant based on ID

### GET /api/v1/items
- Get details of all items
### GET /api/v1/items/:id
- Get details of a single item by ID
### POST /api/v1/items
- Create an item
### PATCH /api/v1/items/:id
- Update a single item's details
### DELETE /api/v1/items/:id
- Delete a single item
### GET /api/v1/items/:id/merchant
- Get associated merchant for a single item by ID

### GET /api/v1/items/find?<attribute>=<value>
- Get a single item meeting search criteria
### GET /api/v1/items/find_all?<attribute>=<value>
- Get all items meeting search criteria 

### GET /api/v1/revenue?start=<start_date>&end=<end_date>
- Get total revenue between a start date and end date
