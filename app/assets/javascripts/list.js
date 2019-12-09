function addToList (generalId, listId ) {
    $.post("lists/"+listId+"/add", {general_id:generalId}, function(error){
        if (error){
            console.log(error)
        }
        else {
            $("#added_success_message").css("display","block").text("Added!")
        }
    })
    return false
}