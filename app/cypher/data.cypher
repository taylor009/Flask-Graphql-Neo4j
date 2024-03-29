CREATE (rec1:Receipt {total_amount: 10.37, timestamp: "28/04/2018 19:19"})
CREATE (rec2:Receipt {total_amount: 3.85, timestamp: "26/04/2018 20:18"})

CREATE (st1:Store {name: "LIDL", address: "Somewhere in this beautiful planet"})
CREATE (st2:Store {name: "ALDI", address: "Somewhere different"})
CREATE (st3:Store {name: "Albert Heijn", address: "A fancy place"})

CREATE (pr1:Product {name: "Indian Pale Ale", brand: "Elements", category: "Beer"})
CREATE (pr2:Product {name: "Parmesan Cheese", brand: "Faixa Azul", category: "Cheese"})
CREATE (pr3:Product {name: "Old Amsterdam 48+", brand: "Old Amsterdam", category: "Cheese"})
CREATE (pr4:Product {name: "Skimmed Milk", brand: "CowPowers", category: "Milk"})
CREATE (pr5:Product {name: "Hummus", brand: "Egyptian", category: "Spread"})

CREATE (customer:Customer {name: "Charles", email: "charles@gmail.com"})

CREATE
    (customer)-[:HAS]->(rec1),
    (customer)-[:HAS]->(rec2),
    (customer)-[:BOUGHT]->(pr1),
    (customer)-[:BOUGHT]->(pr2),
    (customer)-[:BOUGHT]->(pr3),
    (customer)-[:BOUGHT]->(pr4),
    (rec1)-[:HAS {price: 2.35}]->(pr1),
    (rec1)-[:HAS {price: 4.18}]->(pr3),
    (rec1)-[:HAS {price: 1.49}]->(pr4),
    (rec2)-[:HAS {price: 3.85}]->(pr2),
    (st1)-[:EMITTED]->(rec1),
    (st2)-[:EMITTED]->(rec2),
    (customer)-[:GOES_TO]->(st1),
    (customer)-[:GOES_TO]->(st2),
    (st1)-[:SELLS]->(pr1),
    (st1)-[:SELLS]->(pr2),
    (st1)-[:SELLS]->(pr3),
    (st1)-[:SELLS]->(pr4),
    (st2)-[:SELLS]->(pr1),
    (st2)-[:SELLS]->(pr2),
    (st2)-[:SELLS]->(pr3),
    (st2)-[:SELLS]->(pr4),
    (st3)-[:SELLS]->(pr5)