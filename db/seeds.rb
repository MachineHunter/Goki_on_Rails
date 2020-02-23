# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create(id:1, name: "speedy", description: "moves fast, but the duration between movements is long.");
Genre.create(id:2, name: "heavy", description: "moves slow, but the duration between movements is short.");
Genre.create(id:3, name: "balance", description: "speed and movements duration are balanced.");

Price.create(id:1, name: "restore", cost:50);
Price.create(id:2, name: "restore_thresh", cost:100);
Price.create(id:3, name: "gokiadd", cost:500);
Price.create(id:4, name: "gokiedit", cost:200);
Price.create(id:5, name: "allenhance", cost:2000);

Movement.create(id:1, name:"shiftY", img:"shiftY", description:"dodge below for a short time. 5 scores will be added.");
Movement.create(id:2, name:"rotate", img:"rotate", description:"rotate around for a short time. 10 scores will be added.");
Movement.create(id:3, name:"shiftback", img:"shiftback", description:"shift back for a while. 5 scores will be added.");
Movement.create(id:4, name:"enlarge", img:"enlarge", description:"get large in size for a while. 30 scores will be added.");
Movement.create(id:5, name:"disappear", img:"disappear", description:"disappear for a while. 5 scores will be added.");


Gmove.create(id:1, goki:"goki", move1:1, move2:2);
Gmove.create(id:2, goki:"facegoki", move1:1, move2:4);
Gmove.create(id:3, goki:"bossgoki", move1:2, move2:4);
Gmove.create(id:4, goki:"mildgoki", move1:2, move2:5);
Gmove.create(id:5, goki:"turkishgoki", move1:1, move2:2);
Gmove.create(id:6, goki:"coolgoki", move1:2, move2:3);
Gmove.create(id:7, goki:"germangoki", move1:1, move2:3);
Gmove.create(id:8, goki:"greengoki", move1:1, move2:5);
Gmove.create(id:9, goki:"minigoki", move1:3, move2:4);
Gmove.create(id:10, goki:"stripegoki", move1:4, move2:5);
Gmove.create(id:11, goki:"whitegoki", move1:3, move2:4);


Enhance.create(id:1, name:"shiftY", value:10, description:"additonal score of 10 to shiftY.")
Enhance.create(id:2, name:"rotate", value:10, description:"additional score of 10 to rotate.")
Enhance.create(id:3, name:"shiftback", value:-900, description:"shift back distance will be tripled.")
Enhance.create(id:4, name:"enlarge", value: 1200, description:"enlarge duration will be decreased more than half.")
Enhance.create(id:5, name:"disappear", value:15, description:"additional score of 15 to disappear.")
