var counter = 0

window.addEventListener('message', function(event) {
    switch(event.data.type){
        case 'openMenu':
            $('#dispatchBody1').removeClass('block').addClass('hidden');
            $('#dispatchBody2').removeClass('hidden').addClass('block');
            break;
        case 'sendDispatch':
            addDispatch(event.data.data);
            break;
    }
})

function addDispatch(data) {
    // var uID = createID();
    counter = counter + 1
    let html = "";
    html += `
        <div id="dispatchID" class="bg-[#262b31] w-[350px] pb-2 min-h-[85px] rounded-2xl my-1 animate-in slide-in-from-right-12 mr-2 fill-mode-both fade-in-0 duration-700" data-uid="${data.id}">
            <div class="flex">
                <div id="counter" class="text-gray-300 text-sm w-fit p-1 rounded-lg top-1.5 left-2 relative">#${counter}</div>
                <div id="code" class="bg-[#2b6c58] text-white text-[13px] w-fit py-0.5 px-2 h-fit rounded-3xl top-2 left-2 relative">${data.code}</div>
                <div id="time" class="text-gray-300 text-xs py-1 px-2 ml-auto mt-[10px] mr-[4px]">şimdi</div>
            </div>
            <div id="dispatchPieces" data-uid="${data.id}" class="flex flex-wrap ml-3 mt-1">
            </div>
        </div>
    `;
    $("#dispatches").prepend(html);
    $.each(data.pieces, function(index, value){
        let html2 = "";
        html2 += `
            <div id="piece" class="block text-sm mr-3 mb-1">
                <div id="header" class="text-gray-200 opacity-50">${value.header}</div>
                <div id="text" class="text-gray-300">${value.text}</div>
            </div>
        `;
        $('#dispatchPieces[data-uid="'+data.id+'"]').append(html2);
    })
    $('#dispatchID[data-uid="'+data.id+'"]').fadeIn(1000);
    addTemporaryDispatch(data);
    setTimeout(() => {
        $('#dispatchID[data-uid="'+data.id+'"]').removeClass('animate-in slide-in-from-right fade-in duration-500').addClass("animate-out fade-out duration-700");
        setTimeout(() => {
            $('#dispatchID[data-uid="'+data.id+'"]').remove();
        }, 700);
    }, 7000);
}

function addTemporaryDispatch(data) {
    // var uID = createID();
    let html = "";
    html += `
        <div id="dispatchID2" onclick="SetWaypoint(this.getAttribute('data-uid'))" class="bg-[#262b31] w-[350px] pb-2 min-h-[85px] rounded-2xl my-1 animate-in slide-in-from-right-12 mr-2 fill-mode-both fade-in-0 duration-700" data-uid="${data.id}">
            <div class="flex">
                <div id="counter2" class="text-gray-300 text-sm w-fit p-1 rounded-lg top-1.5 left-2 relative">#${counter}</div>
                <div id="code2" class="bg-[#2b6c58] text-white text-[13px] w-fit py-0.5 px-2 h-fit rounded-3xl top-2 left-2 relative">${data.code}</div>
                <div id="time2" class="text-gray-300 text-xs py-1 px-2 ml-auto mt-[10px] mr-[4px]">şimdi</div>
            </div>
            <div id="dispatchPieces2" data-uid="${data.id}" class="flex flex-wrap ml-3 mt-1">
            </div>
        </div>
    `;
    $("#dispatches2").prepend(html);
    $.each(data.pieces, function(index, value){
        let html2 = "";
        html2 += `
            <div id="piece" class="block text-sm mr-3 mb-1">
                <div id="header" class="text-gray-200 opacity-50">${value.header}</div>
                <div id="text" class="text-gray-300">${value.text}</div>
            </div>
        `;
        $('#dispatchPieces2[data-uid="'+data.id+'"]').append(html2);
    })
    // $('#dispatchID2[data-uid="'+uID+'"]').fadeIn(1000);
}

$(document).keyup(function(e) {
    if (e.key === "Escape") {
        $('#dispatchBody2').removeClass('block').addClass('hidden');
        $('#dispatchBody1').removeClass('hidden').addClass('block');
        $.post('https://deniz-dispatch/dispatch:nui:closeESC');
   }
});

function SetWaypoint(id) {
    $.post('https://deniz-dispatch/dispatch:nui:setWaypoint', JSON.stringify({
        id: id,
    }));
}

// function createID() {
//     return Math.floor((1 + Math.random()) * 0x10000)
//     .toString(16)
//     .substring(1);
// }
