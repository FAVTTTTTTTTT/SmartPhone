<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Hero Start -->
<style>
    .hero-header {
        background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('/client/img/hero-bg.jpg') center center/cover;
        color: #fff;
        padding: 100px 0;
        text-align: center;
    }

    .hero-header h4 {
        font-size: 1.5rem;
        font-weight: 300;
        margin-bottom: 1rem;
        animation: fadeInUp 1s ease-in-out;
    }

    .hero-header h1 {
        font-size: 3.5rem;
        font-weight: 700;
        margin-bottom: 2rem;
        animation: fadeInUp 1.5s ease-in-out;
    }

    .carousel-inner img {
        border-radius: 10px;
        object-fit: cover;
        height: 300px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        transition: transform 0.5s ease;
    }

    .carousel-inner img:hover {
        transform: scale(1.05);
    }

    .carousel .btn {
        background-color: rgba(0, 0, 0, 0.8);
        border: none;
        position: absolute;
        bottom: 20px;
        left: 50%;
        transform: translateX(-50%);
        transition: all 0.3s ease;
        font-weight: bold;
        padding: 10px 20px;
    }

    .carousel .btn:hover {
        background-color: #ff4081;
    }

    .carousel-control-prev-icon,
    .carousel-control-next-icon {
        filter: invert(1);
    }

    .carousel-control-prev,
    .carousel-control-next {
        width: 5%;
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row g-5 align-items-center">
            <div class="col-md-12 col-lg-7">
                <h4 class="mb-3 text-light">100% Sản Phẩm Chính Hãng</h4>
                <h1 class="mb-5 display-3 text-white">Các mẫu mã <br/>chất lượng đi đầu</h1>
            </div>
            <div class="col-md-12 col-lg-5">
                <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img src="/client/img/iphone-15.png" class="img-fluid w-100 h-100" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img src="/client/img/samsung.png" class="img-fluid w-100 h-100" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img src="/client/img/ipad.png" class="img-fluid w-100 h-100" alt="Third slide">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Hero End -->
