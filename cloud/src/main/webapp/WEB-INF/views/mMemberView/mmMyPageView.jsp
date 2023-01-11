<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="row my-5 w3-content" id="global-content">
	<div class="col">
		<div class="row my-3 text-center">
			<div class="col-4 offset-4">
				<h2 class="fs-3 fw-bold">Cloud 마이페이지</h2>
			</div>
		</div>
		<div class="row commReady" id="mreComTitle">
			<div class="col-4 offset-4 p-5 text-start border rounded-4">
				<div class="row border-bottom py-2">
					<span class="fs-4 fw-bold">${mInfo.mmName}</span>
					<span><small>${mInfo.mmEmail}</small></span>
				</div>
				<div class="row border-bottom py-2">
					<span>${mInfo.mmId}</span>
				</div>
				<div class="row border-bottom py-2">
					<span>${mInfo.mmBirth}&nbsp;&nbsp;/&nbsp;&nbsp;${mInfo.mmGen}</span>
				</div>
				<div class="row border-bottom py-2">
					<span>📞&nbsp;&nbsp;${mInfo.mmTel}</span>
				</div>
				<div class="row py-2">
					<span>🏚&nbsp;&nbsp;${mInfo.mmAddr1}</span>
				</div>
				<div class="row border-bottom pb-2 ms-3">
					<span>${mInfo.mmAddr2}</span>
				</div>
				<div class="row pt-2 pb-1">
					<span>카카오 연동 여부 : ${mInfo.mmIdConnKAKAO}</span>
				</div>
				<div class="row py-1">
					<span>구글 연동 여부 : ${mInfo.mmIdConnGOOGLE}</span>
				</div>
				<div class="row py-1">
					<span>네이버 연동 여부 : ${mInfo.mmIdConnNaver}</span>
				</div>
			</div>
		</div>
	</div>
</div>
