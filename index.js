const arr1 = [
    {
        //create data product
        id: 1,
        name: 'product1',
        price: 10,
        stock: 100,
        category:'shoes'
    },
    {
        //create data product
        id: 2,
        name: 'product2',
        price: 20,
        stock: 200,
        category:'shoes'
    },
    {
        //create data product
        id: 3,
        name: 'product3',
        price: 30,
        stock: 300,
        category:'shoes'
    },
];

const arr2 = [
    {
        //create data product
        id: 1,
        name: 'productArr21',
        price: 10,
        stock: 100,
        category:'shoes'
    },
    {
        //create data productArr2
        id: 2,
        name: 'productArr22',
        price: 20,
        stock: 200,
        category:'shoes'
    },
    {
        //create data productArr2
        id: 3,
        name: 'productArr23',
        price: 30,
        stock: 300,
        category:'shoes'
    },
]

function doGetProduct(...dataArrayProduct){
    const dataSum = dataArrayProduct.flat();
    const callData = dataSum.reduce(function(tallArray, item){
        console.log(item.name, 'hallo');
    }, {})
    return 'hai'
}

const result = doGetProduct(arr1, arr2);
console.log(result.price);