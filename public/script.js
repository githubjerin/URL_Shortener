function submit() {
    $.ajax({
        type: "POST",
        url: "http://localhost:4567/",
        dataType: "json",
        data: JSON.stringify({
            "url": document.getElementById("url").value
        }),
        success: function (data) {
            $("p").remove();
            textNode = document.createTextNode(data.url);
            result = document.createElement("p");
            result.appendChild(textNode);
            document.getElementById("result-area").appendChild(result);
        }
    });
}