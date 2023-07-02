function submit() {
    $.ajax({
        type: "POST",
        url: "http://localhost:4567/",
        dataType: "json",
        data: JSON.stringify({
            "url": document.getElementById("url").value
        }),
        success: function (data) {
            renderResult(data.url, "p", "result");
        }
    });
}

function renderResult(data, tagName, id) {
    $('#' + id).remove();
    textNode = document.createTextNode(data);
    result = document.createElement(tagName);
    result.setAttribute("id", id);
    result.appendChild(textNode);
    document.getElementById("result-area").appendChild(result);
}