using Alexandria, Test

@test pow2db(100000) == 50
@test pow2db(100) == 20
@test pow2db(10) == 10
@test pow2db(1) == 0

@test db2pow(0) == 1
@test db2pow(10) == 10
@test db2pow(20) == 100
@test db2pow(50) == 100000
