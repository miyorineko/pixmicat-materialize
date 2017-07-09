if (!Array.prototype.indexOf) { // Inplemented in JavaScript 1.6
	Array.prototype.indexOf = function (item) {
		var i, len = this.length;
		for (i = 0; i < len; i++) {
			if (this[i] === item) {
				return i;
			}
		}
		return -1;
	};
}

var TmodShowhide = {
	hideList: [], // 隱藏討論串列表
	isChange: false, // 是否有更動需回存
	/* 載入討論串隱藏列表並實行隱藏 */
	init: function () {
		var t = getCookie('hideList');
		// 回應模式不動作
		if (location.href.indexOf('.php?res=') !== -1) {
			return;
		}
		jQuery('div.threadpost').each(function () {
			if (!this.id) {
				return;
			}
			var outerDiv = '<div class="threadStructure" id="t' + this.id + '" />';
			jQuery(this).find('.card-content').wrapInner(outerDiv).append(jQuery(this).nextUntil('div.card'));
		});
		if (t !== '') {
			//alert('getCookie');
			TmodShowhide.hideList = t.split(',');
			jQuery('div.threadStructure').each(function () {
				//alert('loop:'+this.id);
				if (TmodShowhide.hideList.indexOf(this.id) !== -1) {
					jQuery(this).hide();
				} // 隱藏討論串
			});
		}
		// 加上控制按鈕
		jQuery('div.threadStructure').each(function () {
			jQuery(this).before('<div class="row"><a class="btn-flat waves-effect waves-light" href="javascript:void(0);" onclick="TmodShowhide.switchThread(\'' + this.id + '\');" title="Hide/Show this thread">+</a><div class="divider"></div></div>');
		});
		//alert('OK:'+TmodShowhide.hideList);
	},
	/* 切換文章顯示與否 */
	switchThread: function (no) {
		var t = TmodShowhide.hideList.indexOf(no);
		TmodShowhide.isChange = true;
		if (t !== -1) {
			TmodShowhide.hideList.splice(t, 1);
			jQuery('div.threadStructure#' + no).show('slow');
		} else {
			TmodShowhide.hideList.push(no);
			jQuery('div.threadStructure#' + no).hide('slow');
		}
		//alert('s:'+TmodShowhide.hideList);
	},
	/* 回存 */
	unload: function () {
		if (TmodShowhide.isChange) {
		}
		//alert('bye');
	}
};

jQuery(TmodShowhide.init); // 註冊載入事件
//jQuery(window).unload(TmodShowhide.unload); // 註冊結束事件