(window.__se_editor_jsonp=window.__se_editor_jsonp||[]).push([[25],{1360:function(e,n,t){"use strict";t.r(n);var r=t(0),i=t.n(r),s=t(54),o=t.n(s),u=t(49),a=t(370),p=t(96),c=t(283),f=t(282),d=(t(810),function(e){function n(n){var t;return(t=e.call(this,n)||this)._ref=u.b.createRef(),t}i()(n,e);var t=n.prototype;return t.componentDidMount=function(){var e=this.props,n=e.i18n;e.useCase.mountPCBGUploader(this._ref.current,n)},t.componentWillUnmount=function(){this.props.useCase.unmountUploader(this._ref.current)},t.render=function(){return u.b.createElement("div",{ref:this._ref,id:"video-thumbnail-wrap"})},n}(u.b.Component));d.defaultProps={i18n:function(e){return e}},d.propTypes={i18n:u.a.func.isRequired,useCase:u.a.instanceOf(f.a).isRequired,store:u.a.instanceOf(c.a).isRequired};var l=Object(a.b)(d),m=function(e){function n(){return e.apply(this,arguments)||this}return i()(n,e),n.prototype.render=function(){var e=this.props.store.opened,n=o()("se-popup-progress-video");return u.b.createElement(p.a,{className:n,opened:e,isDimUse:!1},u.b.createElement(l,this.props))},n}(u.b.Component);m.defaultProps={i18n:function(e){return e}},m.propTypes={className:u.a.string,useCase:u.a.instanceOf(f.a).isRequired,store:u.a.instanceOf(c.a).isRequired,i18n:u.a.func};n.default=Object(a.b)(m)}}]);